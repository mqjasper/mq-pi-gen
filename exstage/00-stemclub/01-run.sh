#!/bin/bash
on_chroot << EOF
if grep -Fxq "/home/pi/*.whl" /home/pi/.bashrc
then 
        echo "tflite already loaded into image"
else
        python3 -m pip download --no-deps -d /home/pi tflite-runtime
        echo -e "python -m pip install /home/pi/*.whl --break-system-packages" | tee -a /home/pi/.bashrc
        echo -e "rm -f /home/pi/*.whl" | tee -a /home/pi/.bashrc
        echo -e "sed -i '/whl/d' /home/pi/.bashrc" | tee -a /home/pi/.bashrc
fi
if grep -Fxq "LIBCAMERA_LOG_LEVELS=*:4" /home/pi/.bashrc
then
        echo "Bash profile already updated for transfer directory and libcamera log level"
else
        echo -e "sudo mkdir /mnt/transfer" | tee -a /home/pi/.bashrc
        echo -e "sed -i '/mkdir \/mnt/d' /home/pi/.bashrc" | tee -a /home/pi/.bashrc
        echo -e "export LIBCAMERA_LOG_LEVELS=*:4" | tee -a /home/pi/.bashrc
fi
EOF

on_chroot << EOF
cd /home/pi
if [ -e /home/pi/stem_club ]; then
    rm -rf stem_club
    git clone https://github.com/altmattr/stem_club.git
else
    git clone https://github.com/altmattr/stem_club.git
fi
install -m 644 "/home/pi/stem_club/services/interface.service" "/lib/systemd/system/"
install -m 644 "/home/pi/stem_club/services/prediction.service" "/lib/systemd/system/"
install -m 644 "/home/pi/stem_club/services/sensors.service" "/lib/systemd/system/"
systemctl enable interface.service
chown -R pi:pi /home/pi/
EOF