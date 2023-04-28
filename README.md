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

## 2. ContainerD 설치
