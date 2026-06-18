#!/bin/bash
# ==============================================================
# 07 - Análisis offline de capturas .pcap con Snort
# --------------------------------------------------------------
# Metodología usada cuando no se dispone de un switch con puerto
# espejo (SPAN): se captura el tráfico con tcpdump a un fichero
# .pcap y después se analiza con Snort en modo offline, aplicando
# las reglas locales definidas en rules/local.rules.
#
# Uso:
#   ./07-analizar-pcap-con-snort.sh wifi.pcap
# ==============================================================

set -e

PCAP="${1:-wifi.pcap}"
CONF="/etc/snort/snort.conf"
RULES="/etc/snort/rules/local.rules"
LOGDIR="/var/log/snort"

if [ ! -f "${PCAP}" ]; then
  echo "Error: no se encuentra el fichero ${PCAP}"
  exit 1
fi

echo "[*] Analizando ${PCAP} con Snort en modo offline..."
sudo snort -c "${CONF}" -r "${PCAP}" -A console -l "${LOGDIR}"

echo "[*] Análisis completado. Revisa las alertas en ${LOGDIR}."
