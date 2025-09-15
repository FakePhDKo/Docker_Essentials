#!/bin/bash

echo ">> 1단계: 포트포워딩 없이 컨테이너 실행하기"

# 기존 컨테이너가 있다면 삭제합니다.
docker rm -f my-lover my-darling &> /dev/null

# 포트포워딩 없이 nginx 컨테이너를 실행합니다.
docker run -d --name my-lover nginx
echo "my-lover 컨테이너가 시작되었습니다. 잠시 대기합니다..."
sleep 3

# 컨테이너 상태 및 포트 정보 확인
docker ps
echo "---"
echo "my-lover 컨테이너의 포트 정보:"
docker port my-lover
echo "---"
echo ">> [결과] 포트포워딩이 없어 아무 정보도 출력되지 않습니다."

# curl을 통해 접속 시도
echo ">> 호스트의 80번 포트로 접속 시도..."
curl http://localhost:80 || true
echo ">> [결과] '연결 거부' 오류가 발생합니다. 외부에서 컨테이너에 접근할 수 없습니다."

read -p "확인하셨다면 Enter를 누르세요."

echo ">> 2단계: 포트포워딩을 설정하고 컨테이너 실행하기"

# 포트포워딩 설정 후 nginx 컨테이너 실행
docker run -d --name my-darling -p 8080:80 nginx
echo "my-darling 컨테이너가 시작되었습니다. 잠시 대기합니다..."
sleep 3

# 컨테이너 상태 및 포트 정보 확인
docker ps
echo "---"
echo "my-darling 컨테이너의 포트 정보:"
docker port my-darling
echo "---"
echo ">> [결과] 호스트의 8080 포트가 컨테이너의 80 포트로 연결되었습니다."

# curl을 통해 접속 시도
echo ">> 호스트의 8080 포트로 접속 시도..."
curl http://localhost:8080
echo ">> [결과] nginx 기본 페이지가 정상적으로 출력됩니다."

echo ">> 실습 완료: 이제 my-darling 컨테이너를 삭제하고 실습을 마무리하세요."
docker stop my-darling && docker rm my-darling