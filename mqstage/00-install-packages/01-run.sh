#!/bin/bash
on_chroot << EOF
python3 -m pip download --no-deps -d /home/pi tflite-runtime
echo -e "python -m pip install /home/pi/*.whl --break-system-packages" | tee -a /home/pi/.bashrc
echo -e "rm *.whl /home/pi/" | tee -a /home/pi/.bashrc
echo -e "sed -i '/whl/d' /home/pi/.bashrc" | tee -a /home/pi/.bashrc
EOF
