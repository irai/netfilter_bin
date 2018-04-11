NETFILTER_DIR=/home/pi/spinifex/golang/bin
VERSION=v0.7


BINARIES=${NETFILTER_DIR}/netfilter_bin/${VERSION}

sudo rm ${NETFILTER_DIR}/netfilter 
sudo rm ${NETFILTER_DIR}/netfilter.systemd
sudo rm ${NETFILTER_DIR}/firewall.sh

sudo ln -s ${BINARIES}/netfilter ${NETFILTER_DIR}/netfilter
sudo ln -s ${BINARIES}/netfilter.systemd ${NETFILTER_DIR}/netfilter.systemd
sudo ln -s ${BINARIES}/firewall.sh ${NETFILTER_DIR}/firewall.sh
