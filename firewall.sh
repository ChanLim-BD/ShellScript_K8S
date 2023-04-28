#!/bin/bash

# firewalld 패키지 설치
sudo apt-get install firewalld

# firewalld 서비스 시작 및 부팅시 자동 시작 설정
sudo systemctl start firewalld
sudo systemctl enable firewalld

# 방화벽 규칙 추가
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https

sudo firewall-cmd --permanent --add-port=2379-2380/tcp
sudo firewall-cmd --permanent --add-port=6443/tcp
sudo firewall-cmd --permanent --add-port=10250-10252/tcp
sudo firewall-cmd --permanent --add-port=8285/udp
sudo firewall-cmd --permanent --add-port=8472/udp

sudo firewall-cmd --permanent --add-port=10250/tcp
sudo firewall-cmd --permanent --add-port=30000-32767/tcp
sudo firewall-cmd --permanent --add-port=8285/udp
sudo firewall-cmd --permanent --add-port=8472/udp

sudo firewall-cmd --permanent --add-port=26443/tcp

# 방화벽 규칙 적용
sudo firewall-cmd --reload
