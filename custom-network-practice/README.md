# Docker Networking Practice: Custom Bridge Network📝
## 📖 디렉토리 개요
이 디렉토리는 컨테이너 간의 통신 방식을 직접 실습하고 이해하는 과정입니다. 기본적으로 격리된 컨테이너들이 서로를 이름으로 인식하고 통신할 수 있도록, 사용자 정의 브리지 네트워크를 생성하고 활용하는 방법을 담고 있습니다.

이 실습을 통해 학습한 내용들:

+ 기본 브리지 네트워크의 한계와 사용자 정의 네트워크의 필요성

+ 컨테이너 이름 기반 DNS(Domain Name System) 확인 원리

+ 안정적인 컨테이너 통신 환경 구축

## 📂 프로젝트 파일 구조
```
.
└── run_network_practice.sh
run_network_practice.sh: 컨테이너 네트워크 실습의 모든 과정을 자동화하는 쉘 스크립트입니다.
```

## 🚀 실습 내용
### 1. 기본 브리지 네트워크 통신 실패
먼저, --network 옵션 없이 컨테이너를 실행했을 때 서로의 이름을 인식하지 못하고 통신이 실패하는 것을 확인합니다.

실행:

Bash

```bash
docker run -d --name alpine1 alpine sleep 3600
docker run -d --name alpine2 alpine sleep 3600
```

결과:
alpine1 컨테이너에서 alpine2로 ping을 시도하면 ping: bad address 'alpine2' 오류가 발생합니다. 이는 Docker의 기본 브리지 네트워크가 컨테이너 간의 이름 확인(name resolution)을 지원하지 않기 때문입니다.

### 2. 사용자 정의 네트워크 통신 성공
다음으로, 직접 만든 네트워크에 컨테이너들을 연결하여 통신이 성공하는 것을 증명합니다.

네트워크 생성:

Bash

```bash
docker network create my-custom-network
```

실행:

Bash

```bash
docker run -d --name alpine1 --network my-custom-network alpine sleep 3600
docker run -d --name alpine2 --network my-custom-network alpine sleep 3600
```

결과:
alpine1 컨테이너에서 alpine2로 ping을 시도하면 정상적으로 패킷이 오가는 것을 확인할 수 있습니다. Docker는 사용자 정의 네트워크에 연결된 컨테이너들에 대해 내장 DNS 서버를 제공하여 컨테이너 이름으로 통신할 수 있게 해줍니다.

## ▶️ 실습 실행 방법
이 저장소를 클론합니다.

Bash

```bash
git clone [github-repo-url]
cd [repo-name]
```

실습 스크립트를 실행합니다. 스크립트가 단계별로 안내하며 모든 과정을 자동으로 진행합니다.

Bash

```bash
bash run_network_practice.sh
```

실습결과 예시
```bash
[root@docker1 ~/mypra/custom-network-practice]# . run_network_practice.sh 
>> 1단계: 기본 브리지 네트워크에서 컨테이너 간 통신 실패 확인
>>> 기본 네트워크에서 alpine1-default, alpine2-default 컨테이너 실행 중...
Unable to find image 'alpine:latest' locally
latest: Pulling from library/alpine
9824c27679d3: Pull complete 
Digest: sha256:4bcff63911fcb4448bd4fdacec207030997caf25e9bea4045fa6c8c44de311d1
Status: Downloaded newer image for alpine:latest
3293bf5c4196c1946fc27793fd92a693ca05dd2dde7b3c844c600ec92d30b7db
fb4e5a5758d290ea0c218aec9a6aac15bb5df27d5cf9c6484eee626a4d3f3fa4
>>> 컨테이너가 시작되었습니다. 잠시 대기합니다...
>>> alpine1-default에서 alpine2-default로 ping 시도 (실패 예상)
ping: bad address 'alpine2-default'
>>> [결과] 'bad address' 오류가 발생합니다. 컨테이너 이름을 인식하지 못합니다.
확인하셨다면 Enter를 누르세요.

>> 2단계: 사용자 정의 브리지 네트워크에서 컨테이너 간 통신 성공 확인
>>> 'my-custom-network' 네트워크 생성 중...
1a78fa99a68a33cee8353ef7e7a0b0202327224d204cda4bfd0c9e89fb4c0a9b
ca4444c4a3725b97ad97bac2072ac38e641ba0df84b1ccc64cd241d19a517aaa
26a0a7a3345ee25368304adebf7a8e75f5b0486d3a58a39d0e73c5d5bad7c0c2
>>> 컨테이너가 시작되었습니다. 잠시 대기합니다...
>>> alpine1-custom에서 alpine2-custom으로 ping 시도 (성공 예상)
PING alpine2-custom (172.19.0.3): 56 data bytes
64 bytes from 172.19.0.3: seq=0 ttl=64 time=0.111 ms
64 bytes from 172.19.0.3: seq=1 ttl=64 time=0.076 ms
64 bytes from 172.19.0.3: seq=2 ttl=64 time=0.077 ms

--- alpine2-custom ping statistics ---
3 packets transmitted, 3 packets received, 0% packet loss
round-trip min/avg/max = 0.076/0.088/0.111 ms
>>> [결과] ping이 성공했습니다. 컨테이너 이름을 인식하고 통신합니다.
>> 실습 완료: 이제 컨테이너와 네트워크를 삭제하고 실습을 마무리하세요.
```
