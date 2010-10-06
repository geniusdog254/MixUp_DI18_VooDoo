/**************************************************************************** 
 *  (C) Copyright 2008 Samsung Electronics Co., Ltd., All rights reserved
 *
 *  [File Name]   : Scheduler.c
 *  [Description] : The source file implements the internal functions of Scheduler.
 *  [Department]  : System LSI Division/System SW Lab
 *  [Created Date]: 2009/2/10
 *  [Revision History] 	     
 *          - Created this file and implements functions of Scheduler
 *	  			: Optimizing for performance \n
 *
 ****************************************************************************/
/****************************************************************************
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 ****************************************************************************/

#include "s3c-otg-scheduler-scheduler.h"

void init_scheduler(void)
{
	//init_scheduling();
	init_transfer_ready_q();
}

/******************************************************************************/
/*! 
 * @name	int  	reserve_used_resource_for_periodic(u32	usb_time)
 *
 * @brief		this function reserves the necessary resource of USB Transfer for Periodic Transfer.
 *			So, this function firstly checks there ares some available USB Time 
 *			and Channel resource for USB Transfer.
 *			if there exists necessary resources for Periodic Transfer, then reserves the resource.
 *
 * @param	[IN]	usb_time	= indicates the USB Time for the USB Transfer.
 *
 * @return	USB_ERR_SUCCESS		- 	if success to insert pInsertED to S3CScheduler.
 *			USB_ERR_NO_BANDWIDTH	-	if fail to reserve the USB Bandwidth.
 *			USB_ERR_NO_CHANNEL		-	if fail to reserve the Channel.
 */
/******************************************************************************/

int  	reserve_used_resource_for_periodic(u32	usb_time, 
						u8 	dev_speed,
						u8	 trans_type)
{		
	if(inc_perio_bus_time(usb_time,dev_speed)==USB_ERR_SUCCESS)
	{
		if(inc_perio_chnum()==USB_ERR_SUCCESS)
		{
			otg_usbcore_inc_usb_bandwidth(usb_time);
			otg_usbcore_inc_periodic_transfer_cnt(trans_type);
			return USB_ERR_SUCCESS;
		}
		else
		{
			dec_perio_bus_time(usb_time);
			return USB_ERR_NO_CHANNEL;
		}
	}
	else
	{
		return USB_ERR_NO_BANDWIDTH;
	}

}


/******************************************************************************/
/*! 
 * @name	int  	free_usb_resource_for_periodic(ed_t *		pFreeED)
 *
 * @brief		this function frees the resources to be allocated to pFreeED at S3CScheduler.
 *			that is, this functions only releases the resources to be allocated by S3C6400Scheduler.
 *
 * @param	[IN]	pFreeED	= indicates ed_t to have the information of the resource to be released.
 *
 * @return	USB_ERR_SUCCESS	- 	if success to free the USB Resource.
 *			USB_ERR_FAIL		-	if fail to free the USB Resrouce.
 */
/******************************************************************************/
int  	free_usb_resource_for_periodic(	u32	free_usb_time, 
						u8	free_chnum, 
						u8	trans_type)
{		
	if(dec_perio_bus_time(free_usb_time)==USB_ERR_SUCCESS)
	{
		if(dec_perio_chnum()==USB_ERR_SUCCESS)
		{			
			if(free_chnum!=CH_NONE)
			{
				oci_channel_dealloc(free_chnum);
				set_transferring_td_array(free_chnum, 0);
			}
			otg_usbcore_des_usb_bandwidth(free_usb_time);
			otg_usbcore_des_periodic_transfer_cnt(trans_type);			
			return USB_ERR_SUCCESS;
		}
	}		
	return USB_ERR_FAIL;
}

/******************************************************************************/
/*! 
 * @name	int  	remove_ed_from_scheduler(ed_t *	remove_ed)
 *
 * @brief		this function just remove the remove_ed from TransferReadyQ. So if you want to
 *			stop the USB Tranfer of remove_ed or release the releated resources. 
 *			you should call another functions of S3CScheduler.
 *
 * @param	[IN]	remove_ed	= indicates ed_t to be removed from TransferReadyQ.
 *
 * @return	USB_ERR_SUCCESS	- 	if success to remove the remove_ed from TransferReadyQ.
 *			USB_ERR_FAIL		-	if fail to remove the remove_ed from TransferReadyQ.
 */
 /******************************************************************************/
int  	remove_ed_from_scheduler(ed_t 	*remove_ed)
{
	if(remove_ed->ed_status.is_in_transfer_ready_q)
	{
		remove_ed_from_ready_q(remove_ed);
		remove_ed->ed_status.is_in_transfer_ready_q = false;
		
		return USB_ERR_SUCCESS;
	}
	else
	{
		return USB_ERR_FAIL;
	}
}

/******************************************************************************/
/*! 
 * @name	int  	cancel_to_transfer_td(td_t *	cancel_td)
 *
 * @brief		this function stop to execute the USB Transfer of cancel_td and 
 *			release the Channel Resources to be allocated the cancel_td ,if the Transfer Type of 
 *			cancel_td is NonPeriodic Transfer.
 *			this function don't release any usb resources(Channel, USB Bandwidth) for Periodic Transfer.
 *			if you want to release some usb resources for a periodic Transfer, you should call 
 *			the free_usb_resource_for_periodic()
 *
 * @param	[IN]	cancel_td	= 	indicates the td_t to be canceled.
 *
 * @return	USB_ERR_SUCCESS	- 	if success to cancel the USB Transfer of cancel_td.
 *			USB_ERR_FAIL		-	if fail to cancel the USB Transfer of cancel_td.
 */
 /******************************************************************************/
int  	cancel_to_transfer_td(td_t 	*cancel_td)
{
	if(cancel_td->is_transfer_done)
	{
		return USB_ERR_FAIL;
	}
	
	if(cancel_td->is_transferring)
	{
		int err;
		
		err = oci_stop_transfer(cancel_td->cur_stransfer.alloc_chnum);
		
		if(err == USB_ERR_SUCCESS)
		{
			set_transferring_td_array(cancel_td->cur_stransfer.alloc_chnum,0);
			
			cancel_td->cur_stransfer.alloc_chnum 		= 	CH_NONE;
			cancel_td->is_transferring 				= 	false;
			cancel_td->parent_ed_p->ed_status.is_in_transferring	=	false;
			cancel_td->parent_ed_p->ed_status.in_transferring_td	= 	0;
			cancel_td->parent_ed_p->is_need_to_insert_scheduler	=	true;

			if(cancel_td->cur_stransfer.ed_desc_p->endpoint_type == BULK_TRANSFER||
				cancel_td->cur_stransfer.ed_desc_p->endpoint_type == CONTROL_TRANSFER )
			{
				dec_nonperio_chnum();
			}
			return err;
		}
		else
		{
			return err;
		}
	}
	else
	{
		return USB_ERR_FAIL;
	}
}




/******************************************************************************/
/*! 
 * @name	int 	retransmit(td_t 	*retrasmit_td)
 *
 * @brief		this function retransmits the retrasmit_td immediately.
 *			So, the Channel of pRetransmitted is reused for retransmittion.
 *
 * @param	[IN]	retrasmit_td	= 	indicates the pointer ot the td_t to be retransmitted.
 *
 * @return	USB_ERR_SUCCESS	- 	if success to retransmit the retrasmit_td.
 *			USB_ERR_FAIL		-	if fail to retransmit the retrasmit_td.
 */
 /******************************************************************************/
int 	retransmit(td_t 	*retrasmit_td)
{
	u32		td_addr=0;	 

	if(get_transferring_td_array(retrasmit_td->cur_stransfer.alloc_chnum,&td_addr)==USB_ERR_SUCCESS)
	{
		if(td_addr == (u32)retrasmit_td)
		{			
			if(oci_start_transfer(&retrasmit_td->cur_stransfer)== retrasmit_td->cur_stransfer.alloc_chnum)
			{
				retrasmit_td->is_transferring				= true;
				retrasmit_td->parent_ed_p->ed_status.in_transferring_td 	= (u32)retrasmit_td;
				retrasmit_td->parent_ed_p->ed_status.is_in_transfer_ready_q	= false;
				retrasmit_td->parent_ed_p->ed_status.is_in_transferring	= true;
			}			 
		}
		else
		{
			return  USB_ERR_FAIL;
		}
	}
	else
	{
		return  USB_ERR_FAIL;
	}

	return USB_ERR_SUCCESS;
	
}

/******************************************************************************/
/*! 
 * @name	int   	reschedule(td_t 	*reschedule_td)
 *
 * @brief		this function re-schedules the reschedule_td.
 *			So, the Channel of pRescheuleTD is released and reschedule_td is inserted to TransferReadyQ.
 *
 * @param	[IN]	reschedule_td	= 	indicates the pointer ot the td_t to be rescheduled.
 *
 * @return	USB_ERR_SUCCESS	- 	if success to re-schedule the reschedule_td.
 *			USB_ERR_FAIL		-	if fail to re-schedule the reschedule_td.
 */
 /******************************************************************************/
int   	reschedule(td_t 	*reschedule_td)
{
	u32	td_addr;
	
	if(get_transferring_td_array(reschedule_td->cur_stransfer.alloc_chnum, &td_addr)==USB_ERR_SUCCESS)	
	{
		if((u32)reschedule_td == td_addr)
		{
			set_transferring_td_array(reschedule_td->cur_stransfer.alloc_chnum, 0);
			oci_channel_dealloc(reschedule_td->cur_stransfer.alloc_chnum);
				
			reschedule_td->cur_stransfer.alloc_chnum 			= CH_NONE;
			reschedule_td->parent_ed_p->is_need_to_insert_scheduler 	= true;
			reschedule_td->parent_ed_p->ed_status.in_transferring_td 	= 0;

			if(reschedule_td->parent_ed_p->ed_desc.endpoint_type == BULK_TRANSFER||
				reschedule_td->parent_ed_p->ed_desc.endpoint_type == CONTROL_TRANSFER )
			{
				//Increase the available Channel 
				dec_nonperio_chnum();

			}
				
			insert_ed_to_ready_q(reschedule_td->parent_ed_p, false);
			reschedule_td->parent_ed_p->ed_status.is_in_transfer_ready_q	=true;
			
		}
		else
		{
			//this case is not support....
		}
	}
	return USB_ERR_SUCCESS;

}

/******************************************************************************/
/*! 
 * @name	int   	deallocate(td_t 	*deallocate_td)
 *
 * @brief		this function frees resources to be allocated deallocate_td by S3CScheduler.
 *			this function just free the resource by S3CScheduler. that is, Channel Resource.
 *			if there are another td_t at ed_t, deallocate() insert the ed_t to TransferReadyQ.
 *
 * @param	[IN]	deallocate_td	= 	indicates the pointer ot the td_t to be deallocated.
 *
 * @return	USB_ERR_SUCCESS	- 	if success to dealloate the resources for the deallocate_td.
 *			USB_ERR_FAIL		-	if fail to dealloate the resources for the deallocate_td.
 */
 /******************************************************************************/
int   	deallocate(td_t 	*deallocate_td)
{
	u32 td_addr;
	
	if(get_transferring_td_array(deallocate_td->cur_stransfer.alloc_chnum , &td_addr)==USB_ERR_SUCCESS)
	{
		if((u32)deallocate_td == td_addr)
		{
			set_transferring_td_array(deallocate_td->cur_stransfer.alloc_chnum, 0);
			oci_channel_dealloc(deallocate_td->cur_stransfer.alloc_chnum);
						
			deallocate_td->cur_stransfer.alloc_chnum = CH_NONE;
			
			if(deallocate_td->parent_ed_p->ed_desc.endpoint_type == BULK_TRANSFER||
				deallocate_td->parent_ed_p->ed_desc.endpoint_type == CONTROL_TRANSFER )
			{
				//Increase the available Channel 
				dec_nonperio_chnum();
			}	
			
			deallocate_td->parent_ed_p->is_need_to_insert_scheduler = true;			
			
			if(deallocate_td->parent_ed_p->num_td)
			{
				//insert ed_t to TransferReadyQ.
				insert_ed_to_ready_q(deallocate_td->parent_ed_p , false);
				deallocate_td->parent_ed_p->ed_status.is_in_transfer_ready_q	= true;
				deallocate_td->parent_ed_p->is_need_to_insert_scheduler 			= false;
			}	
			return USB_ERR_SUCCESS;
		}
		else
		{
			return USB_ERR_FAIL;
		}
	}
	else
	{		
			return USB_ERR_FAIL;
	}

}

//TBD....
void   		do_schedule(void)
{
	if(get_avail_chnum())
	{
		do_periodic_schedule();
		do_nonperiodic_schedule();
	}
}

/******************************************************************************/
/*! 
 * @name	int 	get_td_info(u8		chnum,
 *				unsigned int 	*td_addr_p)
 *
 * @brief		this function returns the pointer of td_t at TransferringTDArray[chnum]
 *
 * @param	[IN]	chnum	= indicates the index of TransferringTDArray 
 *					to include the address of td_t which we gets
 *		[OUT]	td_addr_p= indicate pointer to store the address of td_t.
 *
 * @return	USB_ERR_SUCCESS	-if success to get the address of td_t.
 *		USB_ERR_FAIL		-if fail to get the address of td_t.
 */
 /******************************************************************************/
int 	get_td_info(	u8		chnum,
			unsigned int 	*td_addr_p)
{
	u32	td_addr;
	
	if(get_transferring_td_array(chnum, &td_addr)==USB_ERR_SUCCESS)
	{
		*td_addr_p = td_addr;
		return USB_ERR_SUCCESS;
	}
	
	return USB_ERR_FAIL;
}


