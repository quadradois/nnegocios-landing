#!/usr/bin/env bash
set -euo pipefail

if [ "$(id -u)" -ne 0 ]; then
  echo "Este script precisa ser executado com privilégios de superusuário."
  echo "Use: sudo ./deploy.sh"
  exit 1
fi

TARGET_USER="${SUDO_USER:-root}"

# Atualiza índices e dependências básicas
apt-get update
apt-get install -y ca-certificates curl gnupg lsb-release

if ! command -v docker >/dev/null 2>&1; then
  echo ">> Instalando Docker Engine..."
  install -m 0755 -d /etc/apt/keyrings
  if [ ! -f /etc/apt/keyrings/docker.gpg ]; then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.gpg
    chmod a+r /etc/apt/keyrings/docker.gpg
  fi

  source /etc/os-release
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $VERSION_CODENAME stable" \
    | tee /etc/apt/sources.list.d/docker.list > /dev/null

  apt-get update
  apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
else
  echo ">> Docker já instalado, verificando plugin docker compose..."
  if ! docker compose version >/dev/null 2>&1; then
    apt-get install -y docker-compose-plugin
  fi
fi

if ! systemctl is-enabled docker >/dev/null 2>&1; then
  systemctl enable docker
fi
systemctl start docker

if [ "$TARGET_USER" != "root" ]; then
  if ! id -nG "$TARGET_USER" | grep -qw docker; then
    usermod -aG docker "$TARGET_USER"
    echo ">> Usuário $TARGET_USER adicionado ao grupo docker. Faça logout/login para aplicar a permissão."
  fi
fi

echo ">> Obtendo imagens mais recentes..."
docker compose pull

echo ">> Iniciando serviços..."
docker compose up -d --remove-orphans

echo ">> Deploy concluído. Status atual:" 
docker compose ps
