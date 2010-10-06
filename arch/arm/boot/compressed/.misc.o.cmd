cmd_arch/arm/boot/compressed/misc.o := /home/jcureton/Desktop/mixup-vc/arm-2009q3/bin/arm-none-linux-gnueabi-gcc -Wp,-MD,arch/arm/boot/compressed/.misc.o.d  -nostdinc -isystem /home/jcureton/Desktop/mixup-vc/arm-2009q3/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.1/include -Iinclude  -I/home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include -include include/linux/autoconf.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-s5pc110/include -Iarch/arm/plat-s5pc11x/include -Iarch/arm/plat-s3c/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Os -marm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -mabi=aapcs-linux -mno-thumb-interwork -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -Wframe-larger-than=1024 -fno-stack-protector -I/home/jcureton/Desktop/mixup-vc/modules/include -fno-omit-frame-pointer -fno-optimize-sibling-calls -g -Wdeclaration-after-statement -Wno-pointer-sign -fwrapv -fno-dwarf2-cfi-asm -fpic -fno-builtin -Dstatic=  -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(misc)"  -D"KBUILD_MODNAME=KBUILD_STR(misc)"  -c -o arch/arm/boot/compressed/misc.o arch/arm/boot/compressed/misc.c

deps_arch/arm/boot/compressed/misc.o := \
  arch/arm/boot/compressed/misc.c \
    $(wildcard include/config/debug/icedcc.h) \
    $(wildcard include/config/cpu/v6.h) \
  include/linux/string.h \
  include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  include/linux/compiler-gcc4.h \
  include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbd.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  include/linux/posix_types.h \
  include/linux/stddef.h \
  /home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include/asm/posix_types.h \
  /home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include/asm/types.h \
  include/asm-generic/int-ll64.h \
  /home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include/asm/string.h \
  arch/arm/mach-s5pc110/include/mach/uncompress.h \
  arch/arm/mach-s5pc110/include/mach/map.h \
  arch/arm/plat-s3c/include/plat/map-base.h \
  arch/arm/plat-s3c/include/plat/uncompress.h \
    $(wildcard include/config/s3c/lowlevel/uart/port.h) \
    $(wildcard include/config/s3c/boot/watchdog.h) \
    $(wildcard include/config/s3c/boot/error/reset.h) \
    $(wildcard include/config/s3c/boot/uart/force/fifo.h) \
  arch/arm/plat-s3c/include/plat/regs-serial.h \
    $(wildcard include/config/plat/s3c64xx.h) \
    $(wildcard include/config/plat/s5pc1xx.h) \
    $(wildcard include/config/plat/s5p64xx.h) \
    $(wildcard include/config/plat/s5pc11x.h) \
    $(wildcard include/config/cpu/s5pc110.h) \
    $(wildcard include/config/cpu/s5p6442.h) \
    $(wildcard include/config/cpu/s3c6400.h) \
    $(wildcard include/config/cpu/s3c6410.h) \
    $(wildcard include/config/cpu/s5pc100.h) \
  arch/arm/plat-s3c/include/plat/regs-watchdog.h \
  arch/arm/boot/compressed/../../../../lib/inflate.c \

arch/arm/boot/compressed/misc.o: $(deps_arch/arm/boot/compressed/misc.o)

$(deps_arch/arm/boot/compressed/misc.o):
