#!/bin/bash
# ==============================================================
# setup-completo.sh - Orquesta todo el laboratorio paso a paso
# --------------------------------------------------------------
# Ejecuta en orden los scripts numerados de esta carpeta.
# Pensado para Kali Linux con dos interfaces cableadas (bridge)
# y una antena WiFi en modo monitor.
#
# Revisa y ajusta las variables de interfaz (eth0/eth1/wlan0) en
# cada script antes de lanzarlo en tu entorno real.
# ==============================================================

set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== 1. Instalación de Snort ==="
bash "${DIR}/01-instalacion-snort.sh"

echo "=== 2. Preparación de interfaces y bridge ==="
bash "${DIR}/02-preparar-bridge.sh"

echo "=== 3. Desactivación de servicios y ajustes de red ==="
bash "${DIR}/03-desactivar-servicios-red.sh"

echo "=== 4. Modo monitor en la interfaz WiFi ==="
bash "${DIR}/04-modo-monitor-wifi.sh"

echo "=== 5. Preparación del directorio de logs ==="
bash "${DIR}/06-preparar-logs.sh"

echo ""
echo "Laboratorio preparado."
echo "Copia rules/local.rules a /etc/snort/rules/local.rules"
echo "y revisa config/snort.conf.snippet para configurar HOME_NET."
echo ""
echo "Para capturar tráfico: ./05-captura-trafico.sh pcap"
echo "Para analizarlo con Snort: ./07-analizar-pcap-con-snort.sh wifi.pcap"
