
HOME=/home/netfilter
#
# fix raspberry PI directory location
#
if [ ! -d "/home/netfilter" ]; then
  sudo ln -s /home/pi /home/netfilter
  sudo mv /home/netfilter/spinifex/private /home/netfilter/private
  sudo cp -r /home/netfilter/spinifex/bin/netfilter_bin /home/netfilter 
fi

# binary location
NETFILTER_BIN=$HOME/bin
mkdir $NETFILTER_BIN

# version : prod vs test
LATEST=${NETFILTER_BIN}/prod
if [[ $1 == "test" ]] ; then
    LATEST=${NETFILTER_BIN}/test
fi

# create new symbolic links
#
sudo rm ${NETFILTER_BIN}/netfilter 
sudo ln -s ${LATEST}/netfilter ${NETFILTER_BIN}/netfilter

sudo rm ${NETFILTER_BIN}/netfilter.script
sudo ln -s ${LATEST}/netfilter.script ${NETFILTER_BIN}/netfilter.script

sudo rm ${NETFILTER_BIN}/download.script
sudo ln -s ${LATEST}/download.script ${NETFILTER_BIN}/download.script

sudo rm ${NETFILTER_BIN}/firewall.sh
sudo ln -s ${LATEST}/firewall.sh ${NETFILTER_BIN}/firewall.sh


# setup systemd services
#
SYSTEMD_DIR=/etc/systemd/system

sudo rm ${SYSTEMD_DIR}/netfilter.service
sudo ln ${LATEST}/netfilter.service ${SYSTEMD_DIR}/netfilter.service

sudo rm ${SYSTEMD_DIR}/download.service
sudo ln ${LATEST}/download.service ${SYSTEMD_DIR}/download.service
sudo rm ${SYSTEMD_DIR}/download.timer
sudo ln ${LATEST}/download.timer ${SYSTEMD_DIR}/download.timer

# DONT update syslogd with unique mac
sudo rm /etc/rsyslog.d/22-loggly.conf
#mac=`ifconfig -a eth0 | awk '/ether/ { print $2 } ' | sed 's/://g'`
#if test -z "$mac"  ; then mac="mac_unknown"; fi
#cat ${LATEST}/22-loggly.conf | sudo sed 's/MAC_ADDRESS/'$mac'/g' > ./tmp.conf
#sudo mv ./tmp.conf /etc/rsyslog.d/22-loggly.conf

sudo /bin/systemctl daemon-reload

sudo systemctl enable rsyslog.service
sudo systemctl enable download.timer
sudo systemctl enable download.service
sudo systemctl enable netfilter.service
#sudo systemctl restart rsyslog.service
sudo systemctl restart netfilter.service
sudo systemctl restart download.timer

