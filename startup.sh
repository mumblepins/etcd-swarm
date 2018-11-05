#!/bin/sh

echo ${NODE_ID}, ${NODE_BASE}, ${CLUSTER_TOKEN}

mkdir -p /etcd-data/${NODE_ID}

exec /usr/local/bin/etcd \
	--data-dir=/etcd-data/${NODE_ID} \
	--name=${NODE_ID} \
	--initial-advertise-peer-urls=http://${NODE_ID}:2380 \
	--listen-peer-urls=http://${NODE_ID}:2380 \
	--listen-client-urls=http://${NODE_ID}:2379,http://localhost:2379 \
	--advertise-client-urls=http://${NODE_ID}:2379 \
	--initial-cluster-token=${CLUSTER_TOKEN} \
	--heartbeat-interval=250 \
	--election-timeout=1250 \
	--initial-cluster=${NODE_BASE}-1=http://${NODE_BASE}-1:2380,${NODE_BASE}-2=http://${NODE_BASE}-2:2380,${NODE_BASE}-3=http://${NODE_BASE}-3:2380 \
	--initial-cluster-state=new
