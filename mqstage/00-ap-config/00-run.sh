#!/bin/bash -e
a[0]="green"
a[1]="yellow"
a[2]="fiesty"
a[3]="strong"
a[4]="pleasant"
a[5]="charming"
a[6]="variable"
a[7]="blinkered"
a[8]="nightly"
a[9]="mixed"
a[10]="ardent"
a[11]="spicy"
a[12]="deadly"
a[13]="fresh"
a[14]="cromulent"
a[15]="daring"
a[16]="effective"
a[17]="furrowed"
a[18]="grizzly"
a[19]="happy"
a[20]="indigo"
a[21]="joyfull"
a[22]="killer"
a[23]="lively"
a[24]="minty"
a[25]="nosy"
a[26]="olive"
a[27]="peacefull"
a[28]="quiet"
a[29]="robust"
a[30]="silly"
a[31]="trail"

b[0]="quail"
b[1]="whale"
b[3]="elf"
b[4]="ranger"
b[5]="twist"
b[6]="yinsh"
b[7]="uncle"
b[8]="ingot"
b[9]="otter"
b[10]="planet"
b[11]="arrow"
b[12]="spider"
b[13]="drongo"
b[14]="bike"
b[15]="couch"
b[16]="drongo"
b[17]="eel"
b[18]="fish"
b[19]="grass"
b[20]="halo"
b[21]="ingot"
b[22]="jinx"
b[23]="krill"
b[24]="llama"
b[25]="mongoose"
b[26]="nickle"
b[27]="ocelot"
b[28]="parrot"
b[29]="slug"
b[30]="toy"
b[31]="van"

size_a=${#a[@]}
size_b=${#b[@]}

index_a=$(($RANDOM % $size_a))
index_b=$(($RANDOM % $size_b))
SSID="${a[$index_a]} ${b[$index_b]}"

sudo cp -a files/shui "${ROOTFS_DIR}/home/pi/shui"
sudo cp -a files/picam_predict "${ROOTFS_DIR}/home/pi/picam_predict"
#find files/picam_predict -type f -exec install -Dm 777 "{}" "${ROOTFS_DIR}/home/pi/picam_predict" 
#find files/.ap_conf_sh -type f -exec install -Dm 777 "{}" "${ROOTFS_DIR}/home/pi/.ap_conf_sh" 
sudo rm "${ROOTFS_DIR}/lib/systemd/system/shui.service"
install -m 644 files/shui/shui.service "${ROOTFS_DIR}/lib/systemd/system/"
# Copy preconfigured NetworkManager access point to directory
install -m 600 files/WiFiAP.nmconnection "${ROOTFS_DIR}/etc/NetworkManager/system-connections/"
install -m 777 files/first-boot-rename "${ROOTFS_DIR}/etc/init.d/"
# Using the code from raspi-config to enable NetworkManager and sense hat service
on_chroot << EOF
update-rc.d first-boot-rename defaults
systemctl enable shui.service
systemctl -q stop dhcpcd 2> /dev/null
systemctl -q disable dhcpcd
systemctl -q enable NetworkManager
EOF