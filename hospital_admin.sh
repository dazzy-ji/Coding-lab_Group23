#!/bin/bash

secure_data() {

echo "Securing active_logs directory..."

# Restrict active_logs access to owner only
chmod 700 active_logs

echo "Current permissions:"

# Display updated directory permissions
ls -ld active_logs 

echo "Permissions updated successfully."

}
