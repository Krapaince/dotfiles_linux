#!/bin/bash

lock.sh

# Prevent the screen flash when exiting the suspend mode
/usr/bin/sleep 1

systemctl suspend
