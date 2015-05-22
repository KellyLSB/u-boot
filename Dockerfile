FROM debian-jessie-armhf
MAINTAINER Kelly Lauren-Summer Becker-Neuding <kbecker@kellybecker.me>

RUN apt-get install u-boot-tools

ENV DEB_HOST_ARCH armhf
ENV CONCURRENCY_LEVEL 2
ENV EXTRAVERSION -kbeckerneuding-20150521
ENV UIMAGE_LOADADDR=10008000

# @TODO: Consider moving the armhf-toolchain
ENV CC=/usr/bin/arm-linux-gnueabihf-gcc

WORKDIR /build
ADD /novena-src /build
ADD /boot.script /build/boot.script

RUN make novena_config
RUN make
RUN make u-boot.imx
RUN mkimage -A arm -O linux -a 0 -e 0 -T script -C none -n "Boot script" -d boot.script boot.scr

RUN mkdir -p /built
RUN cp u-boot.imx SPL u-boot.img u-boot.srec u-boot.bin u-boot boot.scr /built/

WORKDIR /built
ENTRYPOINT tar -cf - *
