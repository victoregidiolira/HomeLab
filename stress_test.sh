#!/bin/bash
echo "Iniciando estresse de CPU e Memória por 60s"
stress --cpu 1 --timeout 30s
echo "Teste concluído."