# U-Boot Docker Build Container

This builds U-Boot in a Docker container for armhf environments; using my armhf-toolchain http://github.com/KellyLSB/armhf-toolchain.
I'm really tired right now at 1:19am so I am going to keep this short.

    $ docker build -t u-boot .
    $ docker run -i u-boot | tar -xf -

The boot.script file came from: https://raw.githubusercontent.com/sutajiokousagi/meta-kosagi/novena/recipes-bsp/u-boot/u-boot-imx/boot.script
