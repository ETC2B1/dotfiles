#!/bin/bash
# server signal portal

# designated IP's
IPSRV="SERVER IP GOES HERE"
IPVPN="VPN IP GOES HERE"
IPTWR="HOME IP GOES HERE"
IP=""

# SSH functions
function shutdown {
    ssh $IP "sudo shutdown -h now"
}
function sshkill {
    ssh $IP "sudo systemctl stop sshd"
}
function reboot {
    ssh $IP "sudo systemctl reboot"
}
function sshreboot {
    ssh $IP "sudo systemctl restart sshd"
}
function netnuke {
    ssh $IP "sudo systemctl stop NetworkManager"
}

# device mapping
if [[ 1 == 1 ]]; then
    if [[ $1 == server ]]; then
	IP="$IPSRV"
	PASS="true"
    elif [[ $1 == VPN ]]; then
	IP="$IPVPN"
	PASS="true"
    elif [[ $1 == tower ]]; then
	IP="$IPTWR"
	PASS="true"
    else
	PASS="false"
    fi
fi

# main
if [[ $PASS == true ]]; then
    echo "IP is: $IP"
    sleep 1
    echo "Executing command: $2"
    sleep 3
    $2
else
    echo "Device $1 is not a device..."
fi
