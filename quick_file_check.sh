#!/bin/bash
# Simple script to check permissions in a file. This was made by Santiago Bernardez
# Usage: ./Quick_file_Check.sh
# What it does: It checks if the file exists and if the permissions are safe.
# Trade-off: Very simple and quickly vs complete check (it doesn't look for the sizes or vulns to not make a big deal)

FILE=$1 #Variable for the file

# Checks if you gave a file (simple if/else)
if [ -z "$FILE" ];
then
  echo "Error: Enter a file"
  exit 1 # Exit if no argument
fi

# Check if the file exists (if/else with -f)
if [ ! -f "$FILE" ];
then
	echo "Error: The file does not exist."
	exit 1 # Exit if not existing
fi

#Check Permissions (stat for numeric, if/else for decision)
perms=$(stat -c %a "$FILE") # Command to get permissions
if [ "$perms" -gt 644 ]; 
then
	echo " Alert: Insecure permissions ($perms) - recommend chmod 644"
else
	echo " Permissions OK ($perms)"
fi

echo " Check complete. Lessons: Used stat for basics (easy). Trade-off: Simple check vs adanced"
