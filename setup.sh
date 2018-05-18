NETFILTER_DIR=/home/pi/spinifex/golang/bin
VERSION=v0.11
    

BINARIES=${NETFILTER_DIR}/netfilter_bin/${VERSION}

# create new symbolic links
#
sudo rm ${NETFILTER_DIR}/netfilter 
sudo rm ${NETFILTER_DIR}/netfilter.systemd
sudo rm ${NETFILTER_DIR}/firewall.sh

sudo ln -s ${BINARIES}/netfilter ${NETFILTER_DIR}/netfilter
sudo ln -s ${BINARIES}/netfilter.systemd ${NETFILTER_DIR}/netfilter.systemd
sudo ln -s ${BINARIES}/firewall.sh ${NETFILTER_DIR}/firewall.sh


# setup systemd services
#
SYSTEMD_DIR=/etc/systemd/system

sudo rm ${SYSTEMD_DIR}/netfilter.service
sudo ln -s ${BINARIES}/netfilter.service ${SYSTEMD_DIR}/netfilter.service
sudo /bin/systemctl daemon-reload

