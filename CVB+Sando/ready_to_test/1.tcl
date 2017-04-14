#===================================================================
#This file is a script to download FPGA bitstream, configure logic,
#download Linux kernel, devicetree and file system, and finally download
#u-boot file and run it on the Zynq zc706 platform
#===================================================================

#Source init file
source ps7_init.tcl

#Download Bistream (make sure board is in JTAG mode)
fpga -f pcie_rc_wrapper.bit

#Connect Cortex-A9 Processor
connect arm hw

#Reset PS part and Fabric
ps7_init

#important step to reset FPGA logic
#init_user
ps7_post_config

#download Linux Kernel Image
dow -data uImage 0x3000000

#download device tree Image
dow -data devicetree.dtb 0x2a00000

#download file system ramdisk
#dow -data uramdisk.image.gz 0x2000000

#download u-boot ELF file
dow u-boot.elf

#run u-boot
run

