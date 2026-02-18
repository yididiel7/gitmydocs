#!/bin/bash
# Test script for markdown header auto-population

# Get current date and time in the required format
DATE=$(date +"%Y-%m-%d (%H:%M:%S Asia/Jerusalem)")
FILENAME="$1"

# Output the header
cat << EOF
**Title:** 
**Date:** ${DATE}
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** ${FILENAME}
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

EOF
