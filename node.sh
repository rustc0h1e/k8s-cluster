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
# ===  join node
# =============================================

echo "NOW JOIN THIS NODE USING : join_node.txt (master) !!"

