#!/bin/bash

function setenv {
	echo -n "Setting ARM environment..."
	export ARCH=arm
	export CROSS_COMPILE="ccache /home/aorth/android/system/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin/arm-eabi-"
	#export CFLAGS="-O2 -Os -floop-interchange -floop-strip-mine -floop-block"
	echo " done."

	echo -n "Setting other environment variables..."
	# the number of CPUs to use when compiling the kernel (auto detect all available)
	export CPUS=`grep -c processor /proc/cpuinfo`
	echo " done."
}

setenv
make -j${CPUS}
