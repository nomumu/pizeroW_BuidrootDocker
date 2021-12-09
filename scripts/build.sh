#!/usr/bin/env bash

THREAD_NUM=8

if [ -e /work/articles ]; then
    cd /work/buildroot/configs
    patch < /work/articles/patches/defconfig.patch

    cd /work/buildroot/board/raspberrypi0w
    cat /work/articles/patches/post-build.patch >> post-build.sh
    cat /work/articles/patches/post-image.patch >> /work/buildroot/package/rpi-firmware/config.txt

    cd /work/buildroot/
    ln -s /work/articles/app app

    make raspberrypi0w_defconfig
    make -j$THREAD_NUM all
fi


