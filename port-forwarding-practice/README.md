# Dockerfile Practice: Nginx Image Build📝
## 📖 프로젝트 개요
이 디렉토리는 Dockerfile을 사용하여 사용자 정의 Docker 이미지를 빌드하고 실행하는 과정을 담고 있습니다. Nginx 공식 이미지를 기반으로, 간단한 HTML 파일을 포함하는 커스텀 웹 서버 이미지를 제작하고 이를 컨테이너로 실행하는 실습입니다.

실습으로 학습한 내용들:

+ Dockerfile의 기본 문법 및 명령어(FROM, COPY, EXPOSE) 이해

+ Docker 이미지 빌드 과정 및 레이어 개념

+ 컨테이너 실행 시 포트포워딩 설정

## 📂 프로젝트 파일 구조
```
.
├── Dockerfile
└── index.html
```
+ Dockerfile: 커스텀 Docker 이미지를 빌드하기 위한 스크립트입니다.

+ index.html: 웹 서버가 제공할 간단한 HTML 파일입니다.

## 🚀 실습 내용
### 1. Dockerfile 작성

이 Dockerfile은 Nginx 베이스 이미지 위에 index.html 파일을 복사하여 새로운 이미지를 생성합니다.
```
Dockerfile
```

#### 사용할 베이스 이미지를 지정합니다. (레이어 1)
```
FROM nginx:latest
```

#### 이미지의 메타데이터를 추가합니다. (레이어 2)
```
LABEL maintainer="Your Name"
```

#### 로컬의 index.html 파일을 컨테이너의 웹 루트 디렉터리로 복사합니다. (레이어 3)
#### COPY [호스트 경로] [컨테이너 경로]
```
COPY index.html /usr/share/nginx/html/index.html
```

#### 컨테이너의 80번 포트를 외부에 노출하도록 설정합니다.
#### 이는 문서화 역할만 하며, 실제 포트 노출은 'docker run' 명령어에서 이루어집니다.
```
EXPOSE 80
```

### 2. 이미지 빌드 및 실행
작성된 Dockerfile을 사용하여 이미지를 빌드하고 컨테이너를 실행합니다.

#### 이미지 빌드:
docker build -t [이미지 이름]:[태그] . 명령어로 이미지를 빌드합니다. .은 Dockerfile이 현재 디렉터리에 있음을 의미합니다.

Bash
```bash
docker build -t my-nginx-image:1.0 .
```
#### 컨테이너 실행:
빌드한 이미지를 사용하여 컨테이너를 실행합니다. -p 옵션으로 호스트의 8080번 포트를 컨테이너의 80번 포트에 연결합니다.

Bash

```bash
docker run -d -p 8080:80 --name my-nginx-container my-nginx-image:1.0
```
## ▶️ 결과 확인
컨테이너가 정상적으로 실행되었는지 확인하고, 웹 브라우저나 curl을 통해 접속합니다.

#### 컨테이너 상태 확인:

Bash

```bash
docker ps -a
```
#### 웹페이지 접속 확인:
웹 브라우저에서 http://localhost:8080에 접속하거나, 터미널에서 curl 명령어를 실행하여 index.html의 내용이 출력되는 것을 확인합니다.

Bash

```bash
curl http://localhost:8080
```

#### 내 터미널에서의 동작 내용
Bash

```bash
[root@docker1 ~/mypra/port-forwarding-practice]# . run_practice.sh
>> 1단계: 포트포워딩 없이 컨테이너 실행하기
046d44521bdbbff5757726752874ff5fb63d4736d125357ddbd43f9b72344a60
my-lover 컨테이너가 시작되었습니다. 잠시 대기합니다...
CONTAINER ID   IMAGE     COMMAND                   CREATED         STATUS         PORTS     NAMES
046d44521bdb   nginx     "/docker-entrypoint.…"   3 seconds ago   Up 3 seconds   80/tcp    my-lover
---
my-lover 컨테이너의 포트 정보:
---
>> [결과] 포트포워딩이 없어 아무 정보도 출력되지 않습니다.
>> 호스트의 80번 포트로 접속 시도...
curl: (7) Failed to connect to localhost port 80: 연결이 거부됨
>> [결과] '연결 거부' 오류가 발생합니다. 외부에서 컨테이너에 접근할 수 없습니다.
확인하셨다면 Enter를 누르세요.
>> 2단계: 포트포워딩을 설정하고 컨테이너 실행하기
893623ae46bed1a741986b7774d4f7591a613b6f0b74c0e124621b83cb8b2bb7
my-darling 컨테이너가 시작되었습니다. 잠시 대기합니다...
CONTAINER ID   IMAGE     COMMAND                   CREATED          STATUS          PORTS                                     NAMES
893623ae46be   nginx     "/docker-entrypoint.…"   4 seconds ago    Up 3 seconds    0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   my-darling
046d44521bdb   nginx     "/docker-entrypoint.…"   12 seconds ago   Up 11 seconds   80/tcp                                    my-lover
---
my-darling 컨테이너의 포트 정보:
80/tcp -> 0.0.0.0:8080
80/tcp -> [::]:8080
---
>> [결과] 호스트의 8080 포트가 컨테이너의 80 포트로 연결되었습니다.
>> 호스트의 8080 포트로 접속 시도...
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
>> [결과] nginx 기본 페이지가 정상적으로 출력됩니다.
>> 실습 완료: 이제 my-darling 컨테이너를 삭제하고 실습을 마무리하세요.
my-darling
my-darling
```
