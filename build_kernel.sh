#!/bin/sh

# Defaults
BUILD_KERNEL=y
CLEAN=n
CROSS_COMPILE="$PWD/../arm-2009q3/bin/arm-none-linux-gnueabi-"
DEFCONFIG=n
MKZIP='7z -mx9 -mmt=1 a "$OUTFILE" .'
PRODUCE_TAR=n
PRODUCE_ZIP=y
TARGET="aries_rev02"
THREADS=3
PUSH_ZIP=n
VERSION=$(date +%m%d%Y)

SHOW_HELP()
{
	echo
	echo "Usage options for build_kernel.sh:"
	echo "-c : Run 'make clean'"
	echo "-d : Use specified config."
	echo "     For example, use -d myconfig to 'make myconfig_defconfig'"
	echo "-h : Print this help."
	echo "-j : Use a specified number of threads to build."
	echo "     For example, use -j4 to make with 4 threads."
	echo "-p : Push the compiled .zip file to /sdcard for flashing."
	echo "	   Dependent on the -z option."
	echo "-t : Produce tar file suitable for flashing with Odin."
	echo "-z : Produce zip file suitable for flashing via Recovery. Requires p7zip installed."
	echo
	exit 1
}

# Get values from Args
set -- $(getopt cd:hj:pt:z "$@")
while [ $# -gt 0 ]
do
	case "$1" in
	(-c) CLEAN=y;;
	(-d) DEFCONFIG=y; TARGET="$2"; shift;;
	(-h) SHOW_HELP;;
	(-j) THREADS=$2; shift;;
	(-p) PUSH_ZIP=y;;
	(-t) PRODUCE_TAR=y;;
	(-z) PRODUCE_ZIP=y;;
	(--) shift; break;;
	(-*) echo "$0: error - unrecognized option $1" 1>&2; exit 1;;
	(*) break;;
	esac
	shift
done

echo "--------------------------------"
echo "Build options:"
echo
echo "make clean    == "$CLEAN
echo "use defconfig == "$DEFCONFIG
echo "build target  == "$TARGET
echo "make threads  == "$THREADS
echo "build kernel  == "$BUILD_KERNEL
echo "create tar    == "$PRODUCE_TAR
echo "create zip    == "$PRODUCE_ZIP
echo "push to phone == "$PUSH_ZIP
echo
echo "--------------------------------"
echo

if [ "$CLEAN" = "y" ] ; then
	echo "Cleaning source directory." && echo ""
	make -j"$THREADS" ARCH=arm clean
fi

if [ "$DEFCONFIG" = "y" -o ! -f ".config" ] ; then
	echo "Using default configuration for $TARGET" && echo ""
	make -j"$THREADS" ARCH=arm ${TARGET}_defconfig
fi

if [ "$BUILD_KERNEL" = "y" ] ; then
	T1=$(date +%s)
	echo "Beginning zImage compilation..." && echo ""
	make -j"$THREADS" ARCH=arm CROSS_COMPILE="$CROSS_COMPILE"
	T2=$(date +%s)
	echo "" && echo "Compilation took $(($T2 - $T1)) seconds." && echo ""
fi

if [ "$PRODUCE_TAR" = y ] ; then
	echo "Generating $TARGET-$VERSION.tar for flashing with Odin" && echo ""
	tar c -C arch/arm/boot zImage >"$TARGET-$VERSION.tar"
fi

if [ "$PRODUCE_ZIP" = y ] ; then
	echo "Generating $TARGET-$VERSION.zip for flashing as update.zip" && echo ""
	rm -fr "$TARGET-$VERSION.zip"
	rm -f update/kernel_update/zImage
	cp arch/arm/boot/zImage update/kernel_update
	OUTFILE="$PWD/zips/$TARGET-$VERSION.zip"
	cd update
	eval "$MKZIP" >/dev/null 2>&1
	echo "Finished .zip creation."
	cd ..
fi

if [ "$PUSH_ZIP" = y ] ; then
	if [ "$PRODUCE_ZIP" = y ] ; then
		echo "Pushing $TARGET-$VERSION.zip to /sdcard/$TARGET-$VERSION.zip for flashing" && echo ""
		OUTFILE="$PWD/zips/$TARGET-$VERSION.zip"
		adb push $OUTFILE /sdcard
		echo "Pushing finished."
	fi
	if [ "$PRODUCE_ZIP" = n ] ; then
		echo "Skipping push: -z argument not included. Since file may not be current, don't push it."
	fi
fi
