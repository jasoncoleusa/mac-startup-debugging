#! /bin/bash

timer=30
max_timer=3600
runtime=0

mkdir -p /tmp/{mem,cpu}

timestamp() {
  date +"%Y-%m-%d_%H:%M:%S"
}

while [ $runtime -lt $max_timer ]; do
  ts=$(timestamp)
  top -l 1 -n 10 -ncols 15 -o mem | grep "PID" -A 100 > /tmp/mem/$ts
  top -l 1 -n 10 -ncols 15 -o cpu | grep "PID" -A 100 > /tmp/cpu/$ts
  ((runtime=$runtime+$timer))
  sleep $timer
done 
