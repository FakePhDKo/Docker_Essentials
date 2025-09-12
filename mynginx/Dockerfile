# 사용할 베이스 이미지를 지정합니다. Nginx 공식 이미지를 사용합니다.
FROM nginx:latest

# MAINTAINER는 도커 1.13.0 버전 이후로 권장하지 않는 명령어입니다.
# 대신 LABEL을 사용해 작성자 정보를 기록하는 것이 좋습니다.
LABEL author="FakePhDKo"

# 호스트의 index.html 파일을 컨테이너의 Nginx 웹 루트 디렉터리로 복사합니다.
# Dockerfile의 COPY 명령어는 레이어를 형성하며, 파일 복사만 담당합니다.
COPY index.html /usr/share/nginx/html/index.html

# 컨테이너의 80번 포트를 외부에 노출하도록 설정합니다.
# 이 명령어는 포트 노출을 위한 문서화 역할만 하며, 실제로 포트를 열지는 않습니다.
EXPOSE 80

# 컨테이너가 시작될 때 실행될 기본 명령어를 정의합니다.
# Nginx 공식 이미지는 이미 이 명령어가 포함되어 있으므로 생략 가능합니다.
CMD ["nginx", "-g", "daemon off;"]