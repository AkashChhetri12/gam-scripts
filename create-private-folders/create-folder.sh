#!/bin/bash

DRIVE_FOLDER_NAME="DELTA"
CSV_FILE="user.csv"

sed 1d "$CSV_FILE" | while IFS=, read -r username userid;
do
  # remove leading and trailing spaces
  username=$(echo $username | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
  userid=$(echo $userid | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

  # check empty username and userid

  if [ -z "$username" ] && [ -z "$userid" ];
  then
    continue
  fi

  if [ -z "$username" ] || [ -z "$userid" ];
  then
    echo "username or userid is empty"
    continue
  fi


  # create folder for users
  folder_id=$(gam user $userid create drivefile drivefilename $DRIVE_FOLDER_NAME mimetype gfolder returnidonly)
  echo "Created $DRIVE_FOLDER_NAME (file_id: $folder_id) folder for $username ($userid)" 
done
