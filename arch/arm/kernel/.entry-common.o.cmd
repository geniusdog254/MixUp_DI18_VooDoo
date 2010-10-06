cmd_arch/arm/kernel/entry-common.o := /home/jcureton/Desktop/mixup-vc/arm-2009q3/bin/arm-none-linux-gnueabi-gcc -Wp,-MD,arch/arm/kernel/.entry-common.o.d  -nostdinc -isystem /home/jcureton/Desktop/mixup-vc/arm-2009q3/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.1/include -Iinclude  -I/home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include -include include/linux/autoconf.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-s5pc110/include -Iarch/arm/plat-s5pc11x/include -Iarch/arm/plat-s3c/include -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork -D__LINUX_ARM_ARCH__=7 -march=armv7-a  -msoft-float -gdwarf-2     -c -o arch/arm/kernel/entry-common.o arch/arm/kernel/entry-common.S

deps_arch/arm/kernel/entry-common.o := \
  arch/arm/kernel/entry-common.S \
    $(wildcard include/config/function/tracer.h) \
    $(wildcard include/config/dynamic/ftrace.h) \
    $(wildcard include/config/cpu/arm710.h) \
    $(wildcard include/config/oabi/compat.h) \
    $(wildcard include/config/arm/thumb.h) \
    $(wildcard include/config/aeabi.h) \
    $(wildcard include/config/alignment/trap.h) \
  /home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include/asm/unistd.h \
  /home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include/asm/ftrace.h \
  arch/arm/mach-s5pc110/include/mach/entry-macro.S \
  /home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include/asm/hardware/vic.h \
  arch/arm/mach-s5pc110/include/mach/map.h \
  arch/arm/plat-s3c/include/plat/map-base.h \
  arch/arm/plat-s5pc11x/include/plat/irqs.h \
  arch/arm/kernel/entry-header.S \
    $(wildcard include/config/frame/pointer.h) \
  include/linux/init.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/hotplug.h) \
  include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  include/linux/linkage.h \
  /home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include/asm/linkage.h \
  /home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include/asm/assembler.h \
    $(wildcard include/config/cpu/feroceon.h) \
  /home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/smp.h) \
  /home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include/asm/hwcap.h \
  include/asm/asm-offsets.h \
  /home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include/asm/errno.h \
  include/asm-generic/errno.h \
  include/asm-generic/errno-base.h \
  /home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/arm/thumbee.h) \
  /home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  arch/arm/kernel/calls.S \

arch/arm/kernel/entry-common.o: $(deps_arch/arm/kernel/entry-common.o)

$(deps_arch/arm/kernel/entry-common.o):
