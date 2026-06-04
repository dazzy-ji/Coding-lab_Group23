#!/bin/bash
archive_logs(){
#initializing a variable to store current timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M")
#for to move all files from active_logs to archived_logs
for file in active_logs/*.log; do 
#variable to store file names with .log extension from active_logs
BASENAME=$(basename "$file" .log)
#move files from active_logs into archived_logs and add a timestamp on the name
mv "$file" "archived_logs/${BASENAME}_${TIMESTAMP}.log"
#create new files in active_logs  
touch "active_logs/${BASENAME}.log"
done
}
archive_logs
