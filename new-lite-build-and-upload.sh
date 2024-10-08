#!/bin/bash
echo "What version is this release? (Don't type the V)"
read version
rm config
printf "IMG_NAME="stemclub"\nTARGET_HOSTNAME=\"stemclub\"\nLOCALE_DEFAULT=\"en_AU.UTF-8\"\nWPA_COUNTRY=\"AU\"\nKEYBOARD_LAYOUT=\"English (Australian)\"\nKEYBOARD_KEYMAP=\"us\"\nFIRST_USER_NAME="pi"\nFIRST_USER_PASS="stemclub"\nDISABLE_FIRST_BOOT_USER_RENAME=1\nENABLE_SSH=1\nTIMEZONE_DEFAULT=\"Sydney/Australia\"\nDEPLOY_COMPRESSION=xz\nSTAGE_LIST=\"stage0 stage1 stage2 exstage\"" > config
touch ./stage3/SKIP ./stage4/SKIP ./stage5/SKIP
touch ./stage4/SKIP_IMAGES ./stage5/SKIP_IMAGES
touch ./exstage/EXPORT_IMAGE
sudo ./build.sh -c config
gh release create "Bookworm V${version}" --generate-notes -t "Bookworm V${version}" $FILENAME
