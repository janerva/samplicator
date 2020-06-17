#!/bin/sh

# Please look the available swithces here (USAGE section): https://github.com/janerva/samplicator/blob/master/README.md
# Remember to leave the -f (fork) switch out from the last command issued, or else the container will exit

# Set the samplicate variable
CMD=/usr/local/bin/samplicate

# Set the host IP variable
HOSTIP=$(/sbin/ip route|awk '/default/ { print $3 }')

# This example listens for UDP packets on port 2055 and forwards it to ports 3055 and 4055 on external IP to keep (spoof) the original address
# as this is problematic with localhost/127.0.0.1
# $CMD -Snfp 2055 ${HOSTIP}/3055 ${HOSTIP}/4055

# This example listens for UDP packets on port 514 and forwards to 192.168.1.1 udp port 514 - only IPv4
# $CMD -f4p 514 192.168.1.1/514

# This example shows how to use a config file (please add "-v /path/to/conifg.file:/opt/config.file" to you docker run-command when creating the container)
# $CMD -p 514 -c /opt/config.file

