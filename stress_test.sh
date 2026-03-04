#!/bin/bash

# Verificar se o stress está instalado
if ! command -v stress &> /dev/null; then
    echo "Erro: A ferramenta 'stress' não está instalada."
    echo "Instalando via pacman..."
    sudo pacman -S --noconfirm stress
fi

# Rodar teste de Estresse
echo "Iniciando estresse de CPU e Memória por 60s"
stress --cpu 1 --timeout 30s
echo "Teste concluído."