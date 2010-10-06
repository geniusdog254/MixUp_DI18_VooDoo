cmd_drivers/tfsr/PAM/s5pc110/FSR_PAM_asm.o := /home/jcureton/Desktop/mixup-vc/arm-2009q3/bin/arm-none-linux-gnueabi-gcc -Wp,-MD,drivers/tfsr/PAM/s5pc110/.FSR_PAM_asm.o.d  -nostdinc -isystem /home/jcureton/Desktop/mixup-vc/arm-2009q3/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.1/include -Iinclude  -I/home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include -include include/linux/autoconf.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-s5pc110/include -Iarch/arm/plat-s5pc11x/include -Iarch/arm/plat-s3c/include -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork -D__LINUX_ARM_ARCH__=7 -march=armv7-a  -msoft-float -gdwarf-2     -c -o drivers/tfsr/PAM/s5pc110/FSR_PAM_asm.o drivers/tfsr/PAM/s5pc110/FSR_PAM_asm.S

deps_drivers/tfsr/PAM/s5pc110/FSR_PAM_asm.o := \
  drivers/tfsr/PAM/s5pc110/FSR_PAM_asm.S \

drivers/tfsr/PAM/s5pc110/FSR_PAM_asm.o: $(deps_drivers/tfsr/PAM/s5pc110/FSR_PAM_asm.o)

$(deps_drivers/tfsr/PAM/s5pc110/FSR_PAM_asm.o):
