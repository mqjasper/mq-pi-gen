#!/bin/bash
rm config
printf "IMG_NAME="stemclub"\nTARGET_HOSTNAME=\"stemclub\"\nLOCALE_DEFAULT=\"en_AU.UTF-8\"\nWPA_COUNTRY=\"AU\"\nKEYBOARD_LAYOUT=\"English (Australian)\"\nKEYBOARD_KEYMAP=\"us\"\nFIRST_USER_NAME="pi"\nFIRST_USER_PASS="stemclub"\nDISABLE_FIRST_BOOT_USER_RENAME=1\nENABLE_SSH=1\nTIMEZONE_DEFAULT=\"Sydney/Australia\"\nDEPLOY_COMPRESSION=xz\nSTAGE_LIST=\"stage0 stage1 stage2 exstage\"" > config
touch ./stage3/SKIP ./stage4/SKIP ./stage5/SKIP
touch ./stage4/SKIP_IMAGES ./stage5/SKIP_IMAGES
touch ./exstage/EXPORT_IMAGE
while [ 1 ]
do
OPT=$(
whiptail --title "Docker build options" --menu "What would you like to do?" --nocancel 25 78 16 \
"Clean" "Perform a build using a fresh container." \
"Examine" "Examine a failed container from a shell" \
"Resume" "Resume an existing container after modifications" \
"Preserve" "Perform a build, but keep the container for incremental testing" \
"Exit" "Exit the menu" 3>&2 2>&1 1>&3
)
case $OPT in
    "Clean")
        ./build-docker.sh
        exit
    ;;

    "Examine")
        sudo docker run -it --privileged --volumes-from=pigen_work mq-pi-gen /bin/bash
        exit
    ;;

    "Resume")
        CONTINUE=1 ./build-docker.sh
        exit
    ;;

    "Preserve")
        PRESERVE_CONTAINER=1 ./build-docker.sh
        exit
    ;;

    "Exit") exit
    ;;
esac
done
exit