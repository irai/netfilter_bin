NETFILTER_DIR=/home/pi/spinifex/golang/bin
VERSION=v0.11
         

BINARIES=${NETFILTER_DIR}/netfilter_bin/${VERSION}

# create new symbolic links
#
sudo rm ${NETFILTER_DIR}/netfilter 
sudo ln -s ${BINARIES}/netfilter ${NETFILTER_DIR}/netfilter

sudo rm ${NETFILTER_DIR}/netfilter.script
sudo ln -s ${BINARIES}/netfilter.script ${NETFILTER_DIR}/netfilter.script

sudo rm ${NETFILTER_DIR}/download.script
sudo ln -s ${BINARIES}/download.script ${NETFILTER_DIR}/download.script

sudo rm ${NETFILTER_DIR}/firewall.sh
sudo ln -s ${BINARIES}/firewall.sh ${NETFILTER_DIR}/firewall.sh


# setup systemd services
#
SYSTEMD_DIR=/etc/systemd/system

sudo rm ${SYSTEMD_DIR}/netfilter.service
sudo ln ${BINARIES}/netfilter.service ${SYSTEMD_DIR}/netfilter.service

sudo rm ${SYSTEMD_DIR}/download.service
sudo ln ${BINARIES}/download.service ${SYSTEMD_DIR}/download.service
sudo rm ${SYSTEMD_DIR}/download.timer
sudo ln ${BINARIES}/download.timer ${SYSTEMD_DIR}/download.timer

sudo /bin/systemctl daemon-reload

sudo systemctl enable download.timer
sudo systemctl enable download.service
sudo systemctl enable netfilter.service
sudo systemctl restart netfilter.service
sudo systemctl restart download.timer
