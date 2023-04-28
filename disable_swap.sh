#!/bin/bash

# Swap 메모리 비활성화
sudo swapoff -a

# /etc/fstab 파일에서 swap 설정 주석 처리
sudo sed -ri '/\sswap\s/s/^#?/#/' /etc/fstab

# Swap 메모리 확인
sudo free -m
