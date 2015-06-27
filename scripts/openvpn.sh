#!/bin/sh

if [ "$#" -ne 2 ]; then
    echo "parameter: server_ip client_name"
    exit 1
fi

IPADDR=$1
CLIENT=$2
SSH="ssh root@$IPADDR"
export OVPN_DATA=ovpn_data

echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list
apt-get update
apt-get install -y docker.io

# Start docker
systemctl enable docker
systemctl start docker

# init openvpn data
docker run --name $OVPN_DATA -v /etc/openvpn busybox
docker run --volumes-from $OVPN_DATA --rm nightling/openvpn ovpn_genconfig -u udp://"$IPADDR"
docker run --volumes-from $OVPN_DATA --rm -it nightling/openvpn ovpn_initpki

# start openvpn server
docker run --name openvpn --volumes-from $OVPN_DATA -v /etc/localtime:/etc/localtime:ro -d -p 1194:1194/udp --cap-add=NET_ADMIN nightling/openvpn

# create client cert
docker run --volumes-from $OVPN_DATA --rm -it nightling/openvpn easyrsa build-client-full "$CLIENT"
docker run --volumes-from $OVPN_DATA --rm nightling/openvpn ovpn_getclient "$CLIENT" > "$CLIENT.ovpn"
