#!/bin/bash

CPU_THRESHOLD=80
MEMORY_THRESHOLD=90
DISK_THRESHOLD=90
INTERVAL=7

check_cpu() {
    echo "Checking CPU usage..."
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -l) )); then
        echo "Warning: High CPU usage at ${cpu_usage}%!" >> monitor.log
    fi
    echo "CPU usage: ${cpu_usage}%" >> monitor.log
}

check_memory() {
    echo "Checking memory usage..."
    memory_usage=$(free -m | awk '/Mem:/ { printf("%.2f"), $3/$2*100 }')
    if (( $(echo "$memory_usage > $MEMORY_THRESHOLD" | bc -l) )); then
        echo "Warning: High memory usage at ${memory_usage}%!" >> monitor.log
    fi
    echo "Memory usage: ${memory_usage}%" >> monitor.log
}

check_disk() {
    echo "Checking disk usage..."
    disk_usage=$(df -h | awk '$NF=="/"{print $5}' | sed 's/%//')
    if (( disk_usage > DISK_THRESHOLD )); then
        echo "Warning: High disk usage at ${disk_usage}%!" >> monitor.log
    fi
    echo "Disk usage: ${disk_usage}%" >> monitor.log
}

trap "echo 'Exiting...'; exit" SIGINT

echo -e "\nWelcome to the project by Carbo\n\nNow checking the device..."

while true; do
    echo -e "\n[$(date +'%Y-%m-%d %H:%M:%S')] System Monitor Log" >> monitor.log
    echo -e "Creating the monitor.log for to report an info-------------\n" >> monitor.log
    check_cpu
    check_memory
    check_disk
    echo "Reported info ----------------------------------------------\n\n" >> monitor.log
    sleep $INTERVAL
done