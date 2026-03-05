# 🚀 Observability & Automation: HomeLab Stack

Uma arquitetura de provisionamento automatizado para ambientes Linux, focada em isolamento de serviços via containers e monitoramento proativo de métricas em tempo real.

## 🎯 Contexto Arquitetural
Este projeto simula um ambiente de produção (NOC/SRE), garantindo que a infraestrutura seja provisionada como código (IaC) e que gargalos de processamento sejam detectados antes de impactarem a operação. 

Utilizei Nginx atuando como proxy reverso para blindar as portas internas dos serviços, expondo apenas o tráfego seguro na porta 80.

## 🛠️ Stack Tecnológico
* **Orquestração:** Docker & Docker Compose (Isolamento de serviços e rede).
* **Time-Series Database:** Prometheus (Scrape de métricas de hardware e containers).
* **Data Visualization:** Grafana (Dashboards dinâmicos e alertas).
* **Proxy Reverso:** Nginx (Roteamento de tráfego centralizado).
* **Automação:** Bash Scripting (`setup_env.sh` para dependências/firewall e `stress_test.sh` para simulação de carga).

## 📋 Como Executar o Ambiente

1. **Provisionamento e Segurança:**
   Instale as dependências e configure as regras de firewall iniciais:
   ```bash
   chmod +x setup_env.sh
   ./setup_env.sh

2. **Deploy da Stack (Containers):**
   Levante a infraestrutura de observabilidade em background:
   ```bash
   docker-compose up -d

3. **Validação de Estresse (Opcional):**
   Gere um pico de consumo de CPU para validar a coleta de métricas:
   ```bash
   chmod +x stress_test.sh
   ./stress_test.sh

## 📈 Monitoramento e Evidências

* **Acesse o painel centralizado através do Proxy Reverso: http://localhost
