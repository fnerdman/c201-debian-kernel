# c201-debian-kernelI've got the kernel, ramdisk and dtb from a debootstrapped debian stretch, all included in this folder. Alternatively you can get the dtb and kernel from the .deb package at https://packages.debian.org/stretch/linux-image-4.8.0-2-armmp, the ramdisk only gets created once you install the package in the debootstrapped system though.

Run ./sign-kernel.sh to create the signed FIT image including ramdisk.
