#!/bin/bash

set -e

echo ">> 1단계: Docker 볼륨을 사용한 웹 콘텐츠 마운트 실습 시작"

# 1-1. 기존 컨테이너 및 볼륨 제거 (스크립트 재실행을 위해)
docker stop nginx-vol &> /dev/null || true
docker rm nginx-vol &> /dev/null || true
docker rm nginx-vol2 &> /dev/null || true
docker volume rm my-nginx-vol &> /dev/null || true

# 1-2. 도커 볼륨 생성
echo ">>> 1. 'my-nginx-vol' 볼륨 생성 중..."
docker volume create my-nginx-vol
echo ">>> 'my-nginx-vol' 볼륨이 생성되었습니다."

# 1-3. 컨테이너 실행 및 볼륨 마운트
echo ">>> 2. 'nginx-vol' 컨테이너를 8081번 포트로 실행 중..."
docker run -d --name nginx-vol -p 8081:80 -v my-nginx-vol:/usr/share/nginx/html nginx
echo ">>> 컨테이너가 실행되었습니다. 내부 파일 추가를 위해 잠시 대기합니다."
sleep 5

# 1-4. 볼륨에 파일 추가 (컨테이너 내부에서)
echo ">>> 3. 컨테이너 내부의 볼륨에 index.html 파일 생성 중..."
docker exec -it nginx-vol bash -c 'echo "<h1>This page is stored on a Docker Volume!</h1>" > /usr/share/nginx/html/index.html'
echo ">>> 파일 생성이 완료되었습니다. http://localhost:8081 에서 확인 가능합니다."

# 결과 확인을 위한 프롬프트
echo ">> 1단계 완료: 웹 브라우저에서 http://localhost:8081 에 접속하여 내용을 확인하세요."
read -p "확인하셨다면 Enter 키를 누르세요."

echo ">> 2단계: 볼륨 데이터의 영속성 확인 실습 시작"

# 2-1. 기존 컨테이너 삭제
echo ">>> 1. 기존 컨테이너 'nginx-vol' 삭제 중..."
docker stop nginx-vol
docker rm nginx-vol
echo ">>> 컨테이너가 삭제되었습니다. 볼륨 데이터는 그대로 남아있습니다."

# 2-2. 새로운 컨테이너 실행
echo ">>> 2. 동일한 볼륨으로 'nginx-vol2' 컨테이너를 8082번 포트로 실행 중..."
docker run -d --name nginx-vol2 -p 8082:80 -v my-nginx-vol:/usr/share/nginx/html nginx
echo ">>> 새로운 컨테이너가 실행되었습니다. http://localhost:8082 에서 확인 가능합니다."

# 최종 완료 메시지
echo ">> 2단계 완료: 새로운 컨테이너에서도 데이터가 유지됨을 확인하세요."
echo ">> 모든 실습이 완료되었습니다. 컨테이너와 볼륨을 정리하려면 'docker stop nginx-vol2 && docker rm nginx-vol2 && docker volume rm my-nginx-vol' 명령어를 실행하세요."