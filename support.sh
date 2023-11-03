#!/bin/bash

# Use ps command to list running processes, exclude header, sort by CPU and get top 5
ps aux --sort=-%cpu | awk '{print $11}' | grep -v COMMAND | head -n 5 > last_session.txt
