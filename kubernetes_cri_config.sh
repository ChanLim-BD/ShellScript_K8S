#!/bin/bash

# containerd.conf 파일 생성 및 overlay, br_netfilter 모듈 로드 설정 추가
cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

# overlay, br_netfilter 모듈 로드
sudo modprobe overlay
sudo modprobe br_netfilter

# 99-kubernetes-cri.conf 파일 생성 및 네트워크 설정 추가
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

# 시스템 설정 다시 불러오기
sudo sysctl --system
