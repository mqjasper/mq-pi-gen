#!/bin/bash -e
install -m 777 files/autologin.sh "${ROOTFS_DIR}/home/pi/"
on_chroot << EOF
cd /home/pi
./autologin.sh
rm -rf /home/pi/autologin.sh
EOF