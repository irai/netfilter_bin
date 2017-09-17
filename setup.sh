NETFILTER_DIR=/home/pi/spinifex/golang/bin
VERSION=v0.4


BINARIES=${NETFILTER_DIR}/netfilter_bin/${VERSION}

rm ${NETFILTER_DIR}/netfilter ${NETFILTER_DIR}/netfilter.systemd

sudo ln -s ${BINARIES}/netfilter ${NETFILTER_DIR}/netfilter
sudo ln -s ${BINARIES}/netfilter.systemd ${NETFILTER_DIR}/netfilter.systemd
