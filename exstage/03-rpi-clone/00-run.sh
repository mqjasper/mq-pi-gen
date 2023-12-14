#!/bin/bash
on_chroot << EOF
	cd /home/pi
	git clone https://github.com/billw2/rpi-clone.git 
	cd rpi-clone
	sudo cp rpi-clone rpi-clone-setup /usr/local/sbin
	cd ..
	rm -r rpi-clone
EOF