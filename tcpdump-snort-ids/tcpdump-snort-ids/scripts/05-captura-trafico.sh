#!/bin/bash
# ==============================================================
# 05 - Captura de tráfico con tcpdump
# --------------------------------------------------------------
# Dos modos de uso:
#   1) Captura en vivo por pantalla (verificación rápida).
#   2) Captura a fichero .pcap para análisis posterior con Snort
#      en modo offline (metodología usada cuando no se dispone
#      de un switch con puerto espejo / SPAN).
#
# Uso:
#   ./05-captura-trafico.sh live      -> captura en vivo (20 pkt)
#   ./05-captura-trafico.sh pcap      -> captura a wifi.pcap
# ==============================================================

set -e

WIFI_IFACE="wlan0"
MODE="${1:-live}"
COUNT=20
OUTFILE="wifi.pcap"

case "$MODE" in
  live)
    echo "[*] Capturando ${COUNT} paquetes en vivo desde ${WIFI_IFACE}..."
    sudo tcpdump -i "${WIFI_IFACE}" -e -nn -c "${COUNT}"
    ;;
  pcap)
    echo "[*] Capturando ${COUNT} paquetes y guardando en ${OUTFILE}..."
    sudo tcpdump -i "${WIFI_IFACE}" -e -nn -c "${COUNT}" -w "${OUTFILE}"
    ;;
  *)
    echo "Uso: $0 {live|pcap}"
    exit 1
    ;;
esac

# --------------------------------------------------------------
# Significado de las opciones:
#   -i   interfaz de red a escuchar
#   -e   muestra la cabecera de enlace (Ethernet/MAC)
#   -n   no resuelve IP a nombres de host
#   -nn  no resuelve IP ni puertos a nombres de servicio
#   -c   número de paquetes a capturar antes de detenerse
#   -w   guarda la captura en un archivo .pcap
# --------------------------------------------------------------
