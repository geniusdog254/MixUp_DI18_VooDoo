/* arch/arm/mach-msm/include/mach/idle.S
 *
 * Idle processing for MSM7K - work around bugs with SWFI.
 *
 * Copyright (c) 2007 QUALCOMM Incorporated.
 * Copyright (C) 2007 Google, Inc. 
 *
 * This software is licensed under the terms of the GNU General Public
 * License version 2, as published by the Free Software Foundation, and
 * may be copied, distributed, and modified under those terms.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 */ 
		
#include <linux/linkage.h>
#include <asm/assembler.h>

ENTRY(msm_pm_collapse)
	ldr     r0, =saved_state
	stmia   r0!, {r4-r14}
	mrc     p15, 0, r1, c1, c0, 0 /* MMU control */
	mrc     p15, 0, r2, c2, c0, 0 /* ttb */
	mrc     p15, 0, r3, c3, c0, 0 /* dacr */
	mrc     p15, 0, ip, c13, c0, 1 /* context ID */
	stmia   r0!, {r1-r3, ip}
#if defined(CONFIG_OPROFILE)
	mrc     p15, 0, r1, c15, c12, 0 /* pmnc */
	mrc     p15, 0, r2, c15, c12, 1 /* ccnt */
	mrc     p15, 0, r3, c15, c12, 2 /* pmn0 */
	mrc     p15, 0, ip, c15, c12, 3 /* pmn1 */
	stmia   r0!, {r1-r3, ip}
#endif
	/* fall though */
ENTRY(msm_arch_idle)
#if defined(CONFIG_MSM_FIQ_SUPPORT)
	cpsid	f
#endif
	mrc     p15, 0, r1, c1, c0, 0    /* read current CR    */ 
	bic     r0, r1, #(1 << 2)        /* clear dcache bit   */
	bic     r0, r0, #(1 << 12)       /* clear icache bit   */
	mcr     p15, 0, r0, c1, c0, 0    /* disable d/i cache  */

	mov     r0, #0                   /* prepare wfi value  */ /* also used as return value from msm_pm_collapse */
	mcr     p15, 0, r0, c7, c10, 0   /* flush the cache    */
	mcr     p15, 0, r0, c7, c10, 4   /* memory barrier     */
	mcr     p15, 0, r0, c7, c0, 4    /* wait for interrupt */

	mcr     p15, 0, r1, c1, c0, 0    /* restore d/i cache  */
#endif
	mov     pc, lr
