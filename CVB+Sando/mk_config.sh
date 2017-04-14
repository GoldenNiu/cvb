#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=arm-xilinx-linux-gnueabi-

make clean

make distclean

make xilinx_zynq_defconfig menuconfig
