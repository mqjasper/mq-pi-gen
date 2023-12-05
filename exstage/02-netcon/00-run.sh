#!/bin/bash -e
# Load the service to rename the SSID on boot
install -m 777 files/rename-on-boot "${ROOTFS_DIR}/etc/init.d/"
# Install a basic script that echoes the pi's serial number to the console, for use when accessing rsync server
install -m 777 files/serial-number "${ROOTFS_DIR}/usr/bin/"
# Custom MOTD when logging in. Will provide IP address, shui status, system uptime, journalctl command
install -m 777 files/motd "${ROOTFS_DIR}/home/pi/"
# Copy preconfigured NetworkManager access point config to directory
install -m 600 files/*.nmconnection "${ROOTFS_DIR}/etc/NetworkManager/system-connections/"

on_chroot << EOF
update-rc.d rename-on-boot defaults
cat /home/pi/motd | tee --append /home/pi/.bashrc > /dev/null
rm /home/pi/motd
EOF
