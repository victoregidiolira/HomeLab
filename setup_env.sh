#!/bin/bash

# Configurações iniciais
USER_SERVICE="svc_monitor"
LOG_FILE="provisioning.log"

echo "log de provisionamento iniciado em: $(date) " > $LOG_FILE

# 1/4 Atualizar base de dados e pacotes essenciais
echo "Atualizando repositórios e instalando dependências..."
sudo pacman -Syu --noconfirm curl htop ufw nmap stress >> $LOG_FILE 2>&1

# 2/4 Configurar firewall (UFW)
echo "Configurando regras de firewall..."
sudo ufw default deny incoming
sudo ufw default deny outgoing
sudo ufw allow 22/tcp           #SSH
sudo ufw allow 80/tcp           #Nginx (Entrada)
sudo ufw allow 443/tcp          #HTTPS
sudo ufw allow 3000/tcp         #Grafana
sudo ufw --force enable >> $LOG_FILE 2>&1

# 3/4 Criar usuario de servico (sem root)
if id "USER_SERVICE" &>/dev/null; then
    echo "Usuário service já existe. Pulando..."
else
    echo "Criando usuário de serviço: $USER_SERVICE"
    sudo useradd -m -s /usr/bin/nologin $USER_SERVICE >> $LOG_FILE 2>&1
fi

# 4/4 Verificação de Integridade do Docker
echo "Validando ambiente Docker..."
if systemctl is-active --quiet docker; then
    echo "Docker está rodando perfeitamente."
else
    echo "Erro: Docker não está ativo. Verificar provisioning.log"
    exit 1
fi

echo "Provisionamento concluído."