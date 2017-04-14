#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=arm-xilinx-linux-gnueabi-

export PATH=$PATH:../u-boot-xlnx/tools

make all

mkimage -A arm -O linux -T kernel -C none -a 00008000 -e 00008000 -n "Linux 3.14" -d arch/arm/boot/zImage uImage 
