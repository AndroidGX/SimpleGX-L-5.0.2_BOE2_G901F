#!/bin/bash
# cleaing script (credits javilonas)


if [ -e boot.img ]; then
	rm boot.img
fi

if [ -e dt.img ]; then
	rm dt.img
fi

if [ -e boot.dt.img ]; then
	rm boot.dt.img
fi

if [ -e compile.log ]; then
	rm compile.log
fi

if [ -e ramdisk.cpio ]; then
	rm ramdisk.cpio
fi

if [ -e ramdisk.cpio.gz ]; then
        rm ramdisk.cpio.gz
fi


find -name '*.ko' -exec rm -rf {} \;
rm -rf arch/arm/boot/zImage > /dev/null 2>&1
rm -rf arch/arm/boot/zImage-dtb > /dev/null 2>&1
rm -rf arch/arm/boot/dt.img > /dev/null 2>&1
rm -rf arch/arm/boot/*.img > /dev/null 2>&1
rm -rf arch/arm/boot/dts/*.dtb > /dev/null 2>&1
rm -rf arch/arm/boot/dts/*.reverse.dts > /dev/null 2>&1
rm -f arch/arm/boot/*.dtb > /dev/null 2>&1
rm -f arch/arm/boot/*.cmd > /dev/null 2>&1
rm -rf arch/arm/boot/Image > /dev/null 2>&1
rm zImage > /dev/null 2>&1
rm zImage-dtb > /dev/null 2>&1
rm boot.dt.img > /dev/null 2>&1
rm boot.img > /dev/null 2>&1
rm dt.img > /dev/null 2>&1
rm *.ko > /dev/null 2>&1
rm *.img > /dev/null 2>&1


make clean && make mrproper
rm Module.symvers > /dev/null 2>&1

