#!/bin/bash

# Docker 설치를 위한 패키지 업데이트
sudo apt-get update

# Docker 설치를 위한 패키지 설치
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Docker GPG 키 다운로드 및 설정
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Docker 패키지 업데이트 및 설치
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Docker 버전 확인
sudo docker version

# Docker 서비스 자동 실행 설정 및 실행
sudo systemctl enable docker
sudo systemctl start docker
