#!/bin/bash

# The function initialize_system is  created
initialize_system() {
	# Checks if the active_logs directory is exists
	if [ -d "active_logs" ]; then
		echo "Directory 'active_logs' already exists"
	else
		echo "Creating 'active_logs' directory..."
		mkdir active_logs
		echo "Directory 'active_logs' has been created"
	fi

	# Checks if the archived_logs directory is exists
	if [ -d "archived_logs" ]; then
		echo "Directory 'archived_logs' already exists"
	else
		echo "Creating 'archived_logs' directory..."
		mkdir archived_logs
		echo "Directory 'archived_logs' has been created"
	fi

	# Checks if the reports directory exists
	if [ -d "reports" ]; then
		echo "Directory 'reports' already exists"
	else
		echo "Creating 'reports' directory..."
		mkdir reports
		echo "Directory 'reports' has been created"
	fi
}

# The function initialize_sytem is called
initialize_system
