# Docker_Essentials📝
## 📖 프로젝트 개요
이 저장소는 Docker의 핵심 개념과 실습 과정을 기록한 개인 포트폴리오입니다. Docker Engine 설치부터 컨테이너 관리, 그리고 Docker Compose를 활용한 다중 컨테이너 애플리케이션 구성까지, 리눅스 서버 환경에서 직접 진행한 실습 코드와 스크립트들을 담고 있습니다.

이 저장소의 목표는 Docker에 대한 이해도를 높이고, 반복적인 작업을 자동화하는 데 필요한 기술들을 정리하는 것입니다.

## 📂 주요 디렉터리 및 파일
```
Docker_Essentials/
├── README.md
├── myscripts/
|   ├── install_docker.sh
|   └── restore_install_docker.sh
├── mynginx/
|   ├── Dockerfile
|   ├── README.md
|   └── index.html
├── 01_volumescript/
|   ├── volume_practive.sh
|   └── README.md
├── port-forwarding-practice/
|   ├── run_practice.sh
|   └── README.md
├── custom-network-practice/
|   ├── run_network_practice.sh
|   └── README.md
```

+ README.md: 이 저장소의 개요와 내용을 설명하는 파일입니다.

+ myscripts/: Docker 설치 및 제거 과정을 자동화하는 쉘 스크립트 모음입니다. 실습 환경을 빠르고 효율적으로 구축하고 초기화하는 데 사용됩니다.

+ mynginx/: Dockerfile을 이용해 간단한 Nginx 웹 서버 이미지를 직접 빌드하고 컨테이너를 실행하는 실습 프로젝트입니다. Dockerfile의 기본 문법을 학습하고 이미지 레이어의 원리를 이해하는 데 중점을 둡니다.

+ 01_volumescript/: Docker 볼륨의 데이터 영속성을 실습하고 검증하는 프로젝트입니다. 컨테이너가 삭제되어도 데이터가 안전하게 보존됨을 증명하는 과정을 담고 있습니다.

+ port-forwarding-practice/: 포트포워딩의 필요성을 이해하는 실습입니다. 컨테이너가 호스트 외부와 어떻게 통신하는지, 그리고 -p 옵션의 역할이 무엇인지 직접 확인합니다.

+ custom-network-practice/: 컨테이너 간의 통신 방식을 심화 학습하는 프로젝트입니다. 사용자 정의 네트워크를 생성하여 컨테이너 이름으로 통신하는 방법을 배우고, DNS 이름 확인의 중요성을 이해합니다.


## 🚀 시작하기
### 1. 저장소 복제
Bash

```bash
git clone https://github.com/[GitHub 사용자명]/Docker_Essentials.git
cd Docker_Essentials
```

### 2. Docker 설치 스크립트 실행
scripts 디렉터리에 있는 설치 스크립트를 사용하여 Docker를 쉽게 설치할 수 있습니다.

Bash

```bash
cd scripts
sudo bash install_docker.sh
참고: 스크립트 실행 후 newgrp docker 명령어를 입력하거나 다시 로그인해야 sudo 없이 Docker 명령어를 사용할 수 있습니다.
```
### 3. 프로젝트 실습
각 프로젝트 디렉터리로 이동하여 README 파일을 참고하거나 docker-compose up 명령어를 사용하여 컨테이너를 실행해보세요.

Bash

```bash
# Docker Compose 프로젝트 실행 예시
cd ../projects/docker-compose-web-db
docker-compose up -d
```
