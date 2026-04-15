#!/bin/bash

LOG_FILE="$HOME/system_health.log"

exec >> $LOG_FILE
exec 2>&1

echo "===== SYSTEM HEALTH REPORT ====="
echo ""

#Thresholds
CPU_LIMIT=80
MEM_LIMIT=80
DISK_LIMIT=85

# CPU Usage
CPU=$(vmstat 1 2 | tail -1 | awk '{print 100 - $15}')
# Memory Usage
MEM=$(free | awk '/^Mem/ {printf("%.0f"), $3/$2 * 100}')
# Disk Usage
DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

echo "CPU Usage: ${CPU}%"
echo "Memory Usage: ${MEM}%"
echo "Disk Usage: ${DISK}%"

echo ""
echo "Status:"

ALERT=0

#Cpu check
if [ $CPU -gt 80 ];
then
	echo "CPU usage high"
	ALERT=1
else
	echo "CPU normal"
fi

#Memory check
if [ $MEM -gt 80 ];
then
	echo "Memory usage high"
	ALERT=1
else
	echo "Memory normal"
fi

#Disk check
if [ $DISK -gt 85 ];
then
	echo "Disk almost full"
	ALERT=1
else
	echo "Disk normal"
fi

echo ""

#Alerting
if [ $ALERT -eq 1 ];
then
	echo "ALERT: HIGH RESOURCE USAGE"
	echo ""

	[ $CPU -gt $CPU_LIMIT ] && echo "CPU USAGE IS ABOVE ${CPU_LIMIT}% (Current: ${CPU}%)"
	[ $MEM -gt $MEM_LIMIT ] && echo "MEMORY USAGE IS ABOVE ${MEM_LIMIT}% (Current: ${MEM}%)"
	[ $DISK -gt $DISK_LIMIT ] && echo "DISK USAGE IS ABOVE ${DISK_LIMIT}% (Current: ${DISK}%)"

	echo ""
	echo "Action Required!"
fi

echo ""
echo "Time: $(date)"
echo "================================"
