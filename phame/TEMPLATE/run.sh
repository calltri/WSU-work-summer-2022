
# Configs 
FOLDER_TO_MOUNT=$(pwd) # folder with refdir, workdir, and the control file
CTL_FILE=main.ctl # Name of the control file in the FOLDER_TO_MOUNT
PHAME_IMG=quay.io/biocontainers/phame:1.0.3--1 # the docker image to use, this will auto download if it doesn't exist

################################
# Don't edit below here!!!
###########################
echo
echo === Setup ===
echo Mounting Folder: $FOLDER_TO_MOUNT
echo Control File: $CTL_FILE
echo Phame Image: $PHAME_IMG
echo
echo === Starting docker container ===
cmd="MSYS_NO_PATHCONV=1 docker run --rm -t -v $FOLDER_TO_MOUNT:/data $PHAME_IMG bash -c 'phame /data/$CTL_FILE'"
echo $cmd # print cmd 
eval $cmd

# move outputs to output directory 
mv workdir/results output/"$(date +"%d-%m-%Y-%s")"