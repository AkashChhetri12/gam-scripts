#!/bin/bash

DRIVE_FOLDER_NAME="DELTA"
CSV_FILE="user.csv"

sed 1d "$CSV_FILE" | while IFS=, read -r username userid;
do
  folder_id=$(gam user $userid create drivefile drivefilename $DRIVE_FOLDER_NAME mimetype gfolder returnidonly)
  echo "Created $DRIVE_FOLDER_NAME (file_id: $folder_id) folder for $username ($userid)" 
done
