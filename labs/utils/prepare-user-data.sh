#!/bin/bash
MASTERIP=`ip -4 addr show enp12s0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'`
TOKEN=$(kubeadm token create --ttl 0)
HASH=$(openssl x509 -in $HOME/.minikube/ca.crt -noout -pubkey | openssl rsa -pubin -outform DER 2>/dev/null | sha256sum | cut -d' ' -f1)
BASEDIR=$(dirname "$0")

sed -i "s/MASTERIP/$MASTERIP/" ${BASEDIR}/metal3-node01-user-data
sed -i "s/TOKEN/$TOKEN/" ${BASEDIR}/metal3-node01-user-data
sed -i "s/HASH/$HASH/" ${BASEDIR}/metal3-node01-user-data
SSHKEY=$(cat $HOME/.ssh/id_rsa.pub)
sed -i "s%SSHKEY%$SSHKEY%" ${BASEDIR}/metal3-node01-user-data
DATA=$(cat ${BASEDIR}/metal3-node01-user-data | base64 -w 0)
sed -i "s@DATA@$DATA@" /${BASEDIR}/metal3-node01-machine.yml
