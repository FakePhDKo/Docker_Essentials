#!/bin/bash

# 에러 발생 시 스크립트 실행 중단
set -e

# 루트 권한 확인
if [ "$(id -u)" -ne 0 ]; then
  echo "이 스크립트는 루트 권한으로 실행해야 합니다."
  exit 1
fi

echo ">> DNF 패키지 업데이트 및 필수 패키지 설치"
sudo dnf -y update
sudo dnf -y install dnf-plugins-core

echo ">> Docker 공식 저장소 추가"
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo ">> Docker Engine 및 관련 도구 설치"
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo ">> Docker 서비스 시작 및 자동 실행 설정"
sudo systemctl enable --now docker

echo ">> 현재 사용자를 'docker' 그룹에 추가"
# 스크립트 실행 시 'sudo'로 실행되므로 Sudo_USER 환경 변수를 사용
# Sudo_USER가 없으면 현재 사용자(whoami)를 사용
USER=${Sudo_USER:-$(whoami)}
sudo usermod -aG docker $USER

echo ">> Docker 설치 및 환경 설정이 완료되었습니다."
echo ">> 변경된 그룹 설정을 적용하려면 재로그인하거나 다음 명령어를 실행하세요:"
echo "   newgrp docker"

exit 0