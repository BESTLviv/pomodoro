#!/bin/bash

# Helps you stay productive using pomodoro technique.
# The first argument is the focus time length.
# The second argument is the break length.

#time in seconds
work_time=${1:-25}*60
break_time=${2:-wseconds/300}*60

while true; do
	clear
	echo "Work:"
	date1=$(($(date +%s) + $work_time))
	while [ "$date1" -ge $(date +%s) ]; do
		echo -ne "$(date -u --date @$(($date1 - $(date +%s))) +%H:%M:%S)\r"
	done
	clear
	echo -e "\aBreak\nTime to walk and rest"
	read -n1 -rsp $'Start! Press any key..'
	clear
	echo "Break:"
	date2=$(($(date +%s) + $break_time))
	while [ "$date2" -ge $(date +%s) ]; do
		echo -ne "$(date -u --date @$(($date2 - $(date +%s))) +%H:%M:%S)\r"
	done
	clear
	echo -e "\aWork\nTime to get back to work"
	read -n1 -rsp $'Start! Press any key..'
done
