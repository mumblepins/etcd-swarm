FROM quay.io/coreos/etcd

ADD startup.sh /usr/local/bin/startup.sh

CMD "/usr/local/bin/startup.sh"
