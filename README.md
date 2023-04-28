![](https://velog.velcdn.com/images/chan9708/post/51a5f5b0-fff3-48a0-8563-b6e5c32fdb05/image.jpg)

---

# 사전 점검

```shell
> nproc #코어 확인
> free -h #메모리 확인
> ifconfig -a #Mac 확인
> sudo cat /sys/class/dmi/id/product_uuid #product_uuid 확인
```

## 1. Swap 메모리 비활성화

```shell
> chmod +x disable_swap.sh
> /disable_swap.sh
```

## 2. 방화벽 설정

![](https://velog.velcdn.com/images/chan9708/post/9b8e37b3-62d4-41ce-a44b-580c419a45c8/image.png)

```shell
> chmod +x firewall.sh
> /firewall.sh
```

## 3. K8S CRI 환경 구성

```shell
> chmod +x kubernetes_cri_config.sh
> /kubernetes_cri_config.sh
```

## 4. SELinux

```shell
> chmod +x SELinux.sh
> /SELinux.sh
```

---

# Container Runtime 설치

## 1. Docker 설치

```shell
> chmod +x docker_install.sh
> /docker_install.sh
```

## 2. ContainerD 설치

```shell
> chmod +x docker_install.sh
> /docker_install.sh

> sudo nano /etc/containerd/config.toml

>>
[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc]
  ...
  [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
    SystemdCgroup = true

수정하기.

이후 sudo systemctl restart containerd
```

---

# K8S 설치

```shell
> chmod +x install_kubernetes.sh
> /install_kubernetes.sh
```

## 추가로 원하는 CNI를 설치해야한다.

### Flannel 설치

```shell
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
```

![](https://velog.velcdn.com/images/chan9708/post/9fdbe3f6-1136-4744-8925-21a3a4d174f7/image.png)

![](https://velog.velcdn.com/images/chan9708/post/4b6c461d-5d34-42c8-9ae0-3db6abcc7c35/image.png)
