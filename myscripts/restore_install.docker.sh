#!/bin/bash

# 에러 발생 시 스크립트 실행 중단
set -e

# 루트 권한 확인
if [ "$(id -u)" -ne 0 ]; then
  echo "이 스크립트는 루트 권한으로 실행해야 합니다."
  exit 1
fi

echo ">> Docker 서비스 중지"
sudo systemctl stop docker || true

echo ">> Docker 패키지 삭제"
sudo dnf -y remove docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo ">> Docker 설정 파일, 이미지, 컨테이너, 볼륨 삭제"
# Docker 관련 디렉터리들이 존재할 경우에만 삭제
if [ -d "/var/lib/docker" ]; then
  sudo rm -rf /var/lib/docker
fi

if [ -d "/var/lib/containerd" ]; then
  sudo rm -rf /var/lib/containerd
fi

echo ">> Docker 공식 저장소 및 DNF 플러그인 제거"
sudo dnf config-manager --remove-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo dnf -y remove dnf-plugins-core

echo ">> 'docker' 그룹 삭제"
# 그룹이 존재할 경우에만 삭제
if getent group docker > /dev/null; then
  sudo groupdel docker
fi

echo ">> Docker 관련 설정이 모두 제거되었습니다."
echo ">> 사용자의 그룹 변경 사항을 완전히 적용하려면 재로그인이 필요합니다."

exit 0