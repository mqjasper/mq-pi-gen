#!/bin/bash
on_chroot << EOF
mv /usr/lib/python3.11/EXTERNALLY-MANAGED /usr/lib/python3.11/EXTERNALLY-MANAGED-OLD
pip install tflite-runtime
mv /usr/lib/python3.11/EXTERNALLY-MANAGED-OLD /usr/lib/python3.11/EXTERNALLY-MANAGED 
EOF
