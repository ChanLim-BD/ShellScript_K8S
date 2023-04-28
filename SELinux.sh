#!/bin/bash

# SELinux 설정 변경
sudo setenforce 0
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

# SELinux 상태 확인
sudo sestatus
