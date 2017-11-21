#!/bin/sh

/usr/bin/ip link set wlp3s0 down
/usr/bin/ip link set wlp3s0 up
/usr/bin/systemctl restart NetworkManager
