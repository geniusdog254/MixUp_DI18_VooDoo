cmd_arch/arm/boot/compressed/piggy.o := /home/jcureton/Desktop/mixup-vc/arm-2009q3/bin/arm-none-linux-gnueabi-gcc -Wp,-MD,arch/arm/boot/compressed/.piggy.o.d  -nostdinc -isystem /home/jcureton/Desktop/mixup-vc/arm-2009q3/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.1/include -Iinclude  -I/home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include -include include/linux/autoconf.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-s5pc110/include -Iarch/arm/plat-s5pc11x/include -Iarch/arm/plat-s3c/include -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork -D__LINUX_ARM_ARCH__=7 -march=armv7-a  -msoft-float -gdwarf-2  -Wa,-march=all   -c -o arch/arm/boot/compressed/piggy.o arch/arm/boot/compressed/piggy.S

deps_arch/arm/boot/compressed/piggy.o := \
  arch/arm/boot/compressed/piggy.S \

arch/arm/boot/compressed/piggy.o: $(deps_arch/arm/boot/compressed/piggy.o)

$(deps_arch/arm/boot/compressed/piggy.o):
