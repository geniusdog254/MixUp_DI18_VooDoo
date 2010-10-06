cmd_arch/arm/lib/io-readsb.o := /home/jcureton/Desktop/mixup-vc/arm-2009q3/bin/arm-none-linux-gnueabi-gcc -Wp,-MD,arch/arm/lib/.io-readsb.o.d  -nostdinc -isystem /home/jcureton/Desktop/mixup-vc/arm-2009q3/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.1/include -Iinclude  -I/home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include -include include/linux/autoconf.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-s5pc110/include -Iarch/arm/plat-s5pc11x/include -Iarch/arm/plat-s3c/include -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork -D__LINUX_ARM_ARCH__=7 -march=armv7-a  -msoft-float -gdwarf-2     -c -o arch/arm/lib/io-readsb.o arch/arm/lib/io-readsb.S

deps_arch/arm/lib/io-readsb.o := \
  arch/arm/lib/io-readsb.S \
  include/linux/linkage.h \
  include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  /home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include/asm/linkage.h \
  /home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include/asm/assembler.h \
    $(wildcard include/config/cpu/feroceon.h) \
  /home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
    $(wildcard include/config/smp.h) \
  /home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include/asm/hwcap.h \

arch/arm/lib/io-readsb.o: $(deps_arch/arm/lib/io-readsb.o)

$(deps_arch/arm/lib/io-readsb.o):
