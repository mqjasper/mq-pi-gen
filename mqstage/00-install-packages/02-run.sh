#!/bin/bash
on_chroot << EOF
mv /usr/lib/python3.11/EXTERNALLY-MANAGED /usr/lib/python3.11/GRR
#python3 -m pip install --upgrade pip
python3 -m pip install 'https://www.piwheels.org/simple/numpy/numpy-1.26.1-cp311-cp311-linux_armv7l.whl'
pip install tflite-runtime
pip install Pillow
mv /usr/lib/python3.11/GRR /usr/lib/python3.11/EXTERNALLY-MANAGED 
EOF
