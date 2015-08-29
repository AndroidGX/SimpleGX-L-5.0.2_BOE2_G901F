#!/bin/bash
# build boot script (credits xdamc2010)


tools/dtbTool -o arch/arm/boot/dt.img -s 4096 -p scripts/dtc/ arch/arm/boot/dts/

cd ramdisk
find . | cpio -o -H newc | gzip > ../ramdisk.img
cd ..

tools/mkbootimg --kernel arch/arm/boot/zImage --ramdisk ramdisk.img --output boot.img \
--cmdline "console=null androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x3b7 dwc3_msm.cpu_to_affin=1" \
--base 0x00000000 --pagesize 4096 --ramdisk_offset 0x02600000 --tags_offset 0x02400000 --dt arch/arm/boot/dt.img

