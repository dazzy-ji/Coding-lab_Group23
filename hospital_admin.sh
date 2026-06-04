#!/bin/bash

secure_data() {

echo "Securing active_logs directory..."

chmod 700 active_logs

echo "Current permissions:"
ls -ld active_logs 

echo "Permissions updated successfully."

}
