# Docker Volume Practice📝
## 📖 디렉토리 개요
이 디렉토리는 Docker Volume의 핵심 개념인 데이터 영속성을 실습하고 검증하는 과정입니다. 컨테이너의 생명주기와 독립적으로 데이터를 관리하는 방법을 배우고, 컨테이너가 삭제되어도 데이터가 안전하게 보존됨을 확인합니다.

## 🚀 실습 내용
+ Docker Volume 생성 및 마운트: Docker가 관리하는 볼륨을 생성하여 Nginx 컨테이너에 연결합니다.

+ 데이터 영속성 확인: 볼륨에 저장된 데이터가 컨테이너 삭제 후에도 유지되는 것을 확인합니다.

## 📁 파일 구조
```
.
└── volume_practice.sh
```

## ▶️ 실습 실행 방법
이 저장소를 클론합니다.

Bash

```bash
git clone [github-repo-url]
cd [repo-name]
```
스크립트를 실행합니다. 스크립트가 단계별로 안내하며 모든 과정을 자동으로 수행합니다.

Bash

```bash
bash volume_practice.sh
```
