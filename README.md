# Docker_Essentials📝
## 📖 프로젝트 개요
이 저장소는 Docker의 핵심 개념과 실습 과정을 기록한 개인 포트폴리오입니다. Docker Engine 설치부터 컨테이너 관리, 그리고 Docker Compose를 활용한 다중 컨테이너 애플리케이션 구성까지, 리눅스 서버 환경에서 직접 진행한 실습 코드와 스크립트들을 담고 있습니다.

이 저장소의 목표는 Docker에 대한 이해도를 높이고, 반복적인 작업을 자동화하는 데 필요한 기술들을 정리하는 것입니다.

## 📂 주요 디렉터리 및 파일
```
Docker_Essentials/
├── README.md
├── scripts/
   ├── install_docker.sh
   └── uninstall_docker.sh
```

+ README.md: 이 저장소의 개요와 내용을 설명하는 파일입니다.

+ scripts/: Docker 설치 및 관리를 자동화하는 쉘 스크립트들을 모아두었습니다.

+ install_docker.sh: CentOS 기반 시스템에 Docker를 설치하고 사용자를 docker 그룹에 추가하는 스크립트입니다.

+ uninstall_docker.sh: Docker와 관련된 모든 패키지와 설정 파일들을 제거하여 시스템을 초기 상태로 복원하는 스크립트입니다.

+ projects/: Docker를 활용한 미니 프로젝트 실습 결과물을 담고 있습니다.

+ basic-nginx/: 간단한 HTML 파일을 담은 정적 웹사이트를 Nginx 컨테이너로 배포하는 실습 프로젝트입니다.

+ docker-compose-web-db/: Docker Compose를 사용하여 웹 서버와 데이터베이스를 하나의 서비스로 묶어 관리하는 실습 프로젝트입니다.

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
