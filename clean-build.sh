#!/bin/bash
touch ./stage3/SKIP ./stage4/SKIP ./stage5/SKIP
touch ./stage4/SKIP_IMAGES ./stage5/SKIP_IMAGES
touch ./mqstage/EXPORT_IMAGE
sudo CLEAN=1 ./build.sh -c config

