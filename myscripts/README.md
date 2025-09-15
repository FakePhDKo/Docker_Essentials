# Docker Installation Scripts📝
## 📖 프로젝트 개요
이 디렉터리는 Docker Engine의 설치 및 제거 과정을 자동화하는 쉘 스크립트 모음입니다. yum/dnf 패키지 관리자를 이용한 Docker 설치 과정을 스크립트로 작성하여, 실습 환경을 빠르고 일관되게 구축하고 초기화할 수 있도록 돕습니다.

이 스크립트들은 단순히 명령어를 나열하는 것을 넘어, 반복적인 시스템 관리 작업을 자동화하는 실무적인 접근 방식을 보여줍니다.

## 📂 파일 목록
### install_docker.sh:

+ 기능: CentOS 기반 시스템에 Docker Engine과 필수 도구들을 설치합니다.

+ 주요 내용: DNF 저장소 설정, 패키지 설치, Docker 서비스 활성화, 그리고 현재 사용자를 docker 그룹에 추가하여 sudo 없이 명령어를 실행할 수 있도록 권한을 설정하는 과정을 포함합니다.

### restore_install_docker.sh:

+ 기능: Docker와 관련된 모든 패키지, 설정 파일, 볼륨, 네트워크를 제거하여 시스템을 초기 상태로 복원합니다.

+ 주요 내용: docker stop과 docker rm을 사용해 컨테이너를 제거하고, dnf remove를 통해 관련 패키지를 삭제합니다. 스크립트의 안정적인 실행을 위해 존재하지 않는 리소스를 삭제할 때 오류가 발생하지 않도록 **|| true**와 같은 예외 처리가 적용되어 있습니다.

## ▶️ 실습 실행 방법
1. 이 디렉터리로 이동합니다.

Bash

```bash
cd myscripts
```

2. install_docker.sh를 실행하여 Docker를 설치합니다.

Bash

```bash
sudo bash install_docker.sh
```
3. 설치 후 restore_install_docker.sh를 실행하여 시스템을 초기화할 수 있습니다.

Bash

```bash
sudo bash restore_install_docker.sh
```
