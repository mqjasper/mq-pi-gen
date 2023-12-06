#!/bin/bash
touch ./stage0/SKIP ./stage1/SKIP ./stage2/SKIP ./stage3/SKIP ./stage4/SKIP ./stage5/SKIP
touch ./stage4/SKIP_IMAGES ./stage5/SKIP_IMAGES
touch ./exstage/EXPORT_IMAGE
sudo ./build.sh -c config
echo "Removing extra stage skips and exiting"
rm ./stage0/SKIP ./stage1/SKIP ./stage2/SKIP
