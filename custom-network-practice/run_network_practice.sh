#!/bin/bash

set -e

echo ">> 1단계: 기본 브리지 네트워크에서 컨테이너 간 통신 실패 확인"

# 기존 컨테이너 및 네트워크가 있다면 삭제 (스크립트 재실행을 위해)
docker rm -f alpine1-default alpine2-default &> /dev/null || true
docker network rm my-custom-network &> /dev/null || true

# 기본 브리지 네트워크에 두 컨테이너 실행
echo ">>> 기본 네트워크에서 alpine1-default, alpine2-default 컨테이너 실행 중..."
docker run -d --name alpine1-default alpine sleep 3600
docker run -d --name alpine2-default alpine sleep 3600
echo ">>> 컨테이너가 시작되었습니다. 잠시 대기합니다..."
sleep 5

# 통신 실패 확인
echo ">>> alpine1-default에서 alpine2-default로 ping 시도 (실패 예상)"
docker exec alpine1-default ping -c 3 alpine2-default || true
echo ">>> [결과] 'bad address' 오류가 발생합니다. 컨테이너 이름을 인식하지 못합니다."
 
echo "확인하셨다면 Enter를 누르세요."
read

echo ">> 2단계: 사용자 정의 브리지 네트워크에서 컨테이너 간 통신 성공 확인"

# 2-1. 사용자 정의 브리지 네트워크 생성
echo ">>> 'my-custom-network' 네트워크 생성 중..."
docker network create my-custom-network

# 2-2. 생성된 네트워크에 두 컨테이너 실행
docker run -d --name alpine1-custom --network my-custom-network alpine sleep 3600
docker run -d --name alpine2-custom --network my-custom-network alpine sleep 3600
echo ">>> 컨테이너가 시작되었습니다. 잠시 대기합니다..."
sleep 5

# 2-3. 통신 성공 확인
echo ">>> alpine1-custom에서 alpine2-custom으로 ping 시도 (성공 예상)"
docker exec alpine1-custom ping -c 3 alpine2-custom
echo ">>> [결과] ping이 성공했습니다. 컨테이너 이름을 인식하고 통신합니다."

echo ">> 실습 완료: 이제 컨테이너와 네트워크를 삭제하고 실습을 마무리하세요."
docker rm -f alpine1-default alpine2-default alpine1-custom alpine2-custom &> /dev/null
docker network rm my-custom-network &> /dev/null