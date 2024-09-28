#!/bin/bash
rm config
rm ./stage3/SKIP
rm ./stage3/SKIP_IMAGES
printf "IMG_NAME="stemclub"\nTARGET_HOSTNAME=\"stemclub\"\nLOCALE_DEFAULT=\"en_AU.UTF-8\"\nWPA_COUNTRY=\"AU\"\nKEYBOARD_LAYOUT=\"English (Australian)\"\nKEYBOARD_KEYMAP=\"us\"\nFIRST_USER_NAME="pi"\nFIRST_USER_PASS="stemclub"\nDISABLE_FIRST_BOOT_USER_RENAME=1\nENABLE_SSH=1\nTIMEZONE_DEFAULT=\"Sydney/Australia\"\nDEPLOY_COMPRESSION=xz\nSTAGE_LIST=\"stage0 stage1 stage2 exstage stage3\"" > config
touch ./stage4/SKIP ./stage5/SKIP
touch ./stage4/SKIP_IMAGES ./stage5/SKIP_IMAGES
touch ./exstage/EXPORT_IMAGE ./stage3/EXPORT_IMAGE
sudo ./build.sh -c config
rm ./stage3/EXPORT_IMAGE