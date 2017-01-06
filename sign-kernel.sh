#!/bin/bash

bash cleanup.sh

wget https://d-i.debian.org/daily-images/armhf/daily/netboot/netboot.tar.gz

tar -xzvf netboot.tar.gz

return 0

mkimage -f kernel-veyron.its kernel.itb

dd if=/dev/zero of=bootloader.bin bs=512 count=1

futility --debug vbutil_kernel --pack vmlinuz.signed --keyblock \
  /usr/share/vboot/devkeys/kernel.keyblock --version 1 \
  --signprivate /usr/share/vboot/devkeys/kernel_data_key.vbprivk \
  --config kernel.flags --vmlinuz kernel.itb \
  --bootloader bootloader.bin \
  --arch arm

rm kernel.itb
echo "Signed kernel ready to get booted at 'vmlinuz.signed'"
