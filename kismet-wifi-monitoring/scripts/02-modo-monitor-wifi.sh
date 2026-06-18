#!/bin/bash
# ==============================================================
# 02 - Interfaz WiFi en modo monitor
# --------------------------------------------------------------
# Comprueba que el adaptador WiFi está reconocido por el sistema,
# elimina procesos que puedan interferir (wpa_supplicant, etc.) y
# activa el modo monitor con airmon-ng.
#
# Edita la variable WIFI_IFACE según tu interfaz inalámbrica.
# ==============================================================

set -e

WIFI_IFACE="wlan0"

echo "[*] Comprobando que la antena WiFi está conectada..."
lsusb

echo "[*] Matando procesos que puedan interferir con el modo monitor..."
sudo airmon-ng check kill

echo "[*] Activando modo monitor en ${WIFI_IFACE}..."
sudo airmon-ng start "${WIFI_IFACE}"
