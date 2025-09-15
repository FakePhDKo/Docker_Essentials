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
