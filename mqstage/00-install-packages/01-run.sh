#!/bin/bash
on_chroot << EOF
#mv /usr/lib/python3.11/EXTERNALLY-MANAGED /usr/lib/python3.11/GRR
#pip install tflite-runtime
#mv /usr/lib/python3.11/GRR /usr/lib/python3.11/EXTERNALLY-MANAGED 
EOF
