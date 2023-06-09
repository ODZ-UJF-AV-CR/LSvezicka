#!/bin/sh
# ------------------------------
# Added by setup_reverse_tunnel.sh
# ------------------------------
# See autossh and google for reverse ssh tunnels to see how this works

# When this script runs it will allow you to ssh into this machine even if it is behind a firewall or has a NAT'd IP address. 
# From any ssh capable machine you just type ssh -p $PORT_NUMBER $SUDO_USER@$MIDDLEMAN_SERVER

# This is the username on your local server who has public key authentication setup at the middleman
USER_TO_SSH_IN_AS=stations

# This is the username and hostname/IP address for the middleman (internet accessible server)
MIDDLEMAN_SERVER_AND_USERNAME=stations@kapybara.ujf.cas.cz

# Port that the middleman will listen on (use this value as the -p argument when sshing)
PORT_MIDDLEMAN_WILL_LISTEN_ON=17372

# Connection monitoring port, don't need to know this one
AUTOSSH_PORT=24492

# Ensures that autossh keeps trying to connect
AUTOSSH_GATETIME=0
su -c "autossh -f -N -R *:${PORT_MIDDLEMAN_WILL_LISTEN_ON}:localhost:22 ${MIDDLEMAN_SERVER_AND_USERNAME} -oLogLevel=error  -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no" ubuntu
