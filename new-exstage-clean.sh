#!/bin/bash
rm config
printf "IMG_NAME="stemclub"\nTARGET_HOSTNAME=\"stemclub\"\nLOCALE_DEFAULT=\"en_AU.UTF-8\"\nWPA_COUNTRY=\"AU\"\nKEYBOARD_LAYOUT=\"English (Australian)\"\nKEYBOARD_KEYMAP=\"us\"\nFIRST_USER_NAME="pi"\nFIRST_USER_PASS="stemclub"\nDISABLE_FIRST_BOOT_USER_RENAME=1\nENABLE_SSH=1\nTIMEZONE_DEFAULT=\"Sydney/Australia\"\nDEPLOY_COMPRESSION=xz\nSTAGE_LIST=\"stage0 stage1 stage2 exstage\"" > config
touch ./stage0/SKIP ./stage1/SKIP ./stage2/SKIP ./stage3/SKIP ./stage4/SKIP ./stage5/SKIP
touch ./stage4/SKIP_IMAGES ./stage5/SKIP_IMAGES
touch ./exstage/EXPORT_IMAGE
sudo CLEAN=1 ./build.sh -c config
echo "Removing extra stage skips and exiting"
rm ./stage0/SKIP ./stage1/SKIP ./stage2/SKIP
