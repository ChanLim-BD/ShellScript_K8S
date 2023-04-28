#!/bin/bash

# K8S 설치를 위한 패키지 업데이트
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl

# GPG 키 다운로드 및 설정
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

# 소스 목록에 Kubernetes 리포지토리 추가
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# 패키지 업데이트 및 Kubernetes 구성 요소 설치
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

# daemon을 다시 로드하고 kubelet을 다시 시작
sudo systemctl daemon-reload
sudo systemctl restart kubelet

# Docker 구성
sudo mkdir /etc/docker

cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

sudo systemctl enable docker
sudo systemctl daemon-reload
sudo systemctl restart docker

# Kubadm을 초기 상태로 재설정
kubeadm reset -f

# kubernetes admin.conf를 현재 사용자에게 복사
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
