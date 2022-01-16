#!/bin/bash
QPKG_NAME="pdulvp-nas-standby"
echo "Start startup_$QPKG_NAME.sh" 					>>/tmp/$QPKG_NAME.log
sleep 2 && echo "mem" > /opt/${QPKG_NAME}/sys-power-state