cmd_arch/arm/plat-s5pc11x/sleep.o := /home/jcureton/Desktop/mixup-vc/arm-2009q3/bin/arm-none-linux-gnueabi-gcc -Wp,-MD,arch/arm/plat-s5pc11x/.sleep.o.d  -nostdinc -isystem /home/jcureton/Desktop/mixup-vc/arm-2009q3/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.1/include -Iinclude  -I/home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include -include include/linux/autoconf.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-s5pc110/include -Iarch/arm/plat-s5pc11x/include -Iarch/arm/plat-s3c/include -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork -D__LINUX_ARM_ARCH__=7 -march=armv7-a  -msoft-float -gdwarf-2     -c -o arch/arm/plat-s5pc11x/sleep.o arch/arm/plat-s5pc11x/sleep.S

deps_arch/arm/plat-s5pc11x/sleep.o := \
  arch/arm/plat-s5pc11x/sleep.S \
    $(wildcard include/config/debug/resume.h) \
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
  arch/arm/mach-s5pc110/include/mach/hardware.h \
  arch/arm/mach-s5pc110/include/mach/map.h \
  arch/arm/plat-s3c/include/plat/map-base.h \
  /home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include/asm/memory.h \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/dram/base.h) \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem.h) \
  include/linux/const.h \
  arch/arm/mach-s5pc110/include/mach/memory.h \
  /home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include/asm/sizes.h \
  include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
  /home/jcureton/Desktop/mixup-vc/linux-2.6.29/arch/arm/include/asm/system.h \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/sa110.h) \
  arch/arm/plat-s5pc11x/include/plat/regs-gpio.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-a0.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-a1.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-b.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-c0.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-c1.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-d0.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-d1.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-e0.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-e1.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-f0.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-f1.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-f2.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-f3.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-g0.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-g1.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-g2.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-g3.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-h0.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-h1.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-h2.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-h3.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-i.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-j0.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-j1.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-j2.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-j3.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-j4.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp01.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp02.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp03.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp04.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp05.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp06.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp07.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp10.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp11.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp12.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp13.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp14.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp15.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp16.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp17.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp18.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp20.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp21.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp22.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp23.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp24.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp25.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp26.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp27.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-mp28.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-gpioint.h \
  arch/arm/plat-s5pc11x/include/plat/gpio-bank-eint.h \
  arch/arm/plat-s5pc11x/include/plat/regs-clock.h \
  arch/arm/mach-s5pc110/include/mach/regs-mem.h \
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

arch/arm/plat-s5pc11x/sleep.o: $(deps_arch/arm/plat-s5pc11x/sleep.o)

$(deps_arch/arm/plat-s5pc11x/sleep.o):
