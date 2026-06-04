#!/bin/bash
archive_logs(){
TIMESTAMP=$(date +"%Y%m%d_%H%M")
for file in active_logs/*.log; do 
BASENAME=$(basename "$file" .log)
mv "$file" "archived_logs/${BASENAME}_${TIMESTAMP}.log"
touch "active_logs/${BASENAME}.log"
done
}
archive_logs
