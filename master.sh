#!/bin/bash


# =============================================
# ===  update
# =============================================

apt-get update && apt-get upgrade -y git && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update

# =============================================
# ===  install binaries
# =============================================

apt-get install -y docker.io kubeadm kubectl kubelet kubernetes-cni

# =============================================
# ===  kubeadm init
# =============================================

kubeadm init > join_node.txt

exit

# =============================================
# ===  allow normal user to use kubectl
# =============================================

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# =============================================
# ===  overlay network : weave
# =============================================

kubectl apply --filename https://git.io/weave-kube-1.6

