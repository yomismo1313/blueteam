#!/bin/bash
# ==============================================================
# 04 - Configuración de la interfaz WiFi en modo monitor
# --------------------------------------------------------------
# Comprueba que la antena WiFi está reconocida por el sistema y
# la pone en modo monitor con airmon-ng para capturar tráfico
# inalámbrico de forma pasiva, sin asociarse a ningún punto de
# acceso.
#
# NOTA: el modo monitor no requiere el bridge en modo bridge;
# son dos mecanismos de captura independientes (cableado vs WiFi).
#
# Edita la variable WIFI_IFACE según tu interfaz inalámbrica.
# ==============================================================

set -e

WIFI_IFACE="wlan0"

echo "[*] Comprobando que la antena WiFi está conectada..."
lsusb

echo "[*] Matando procesos que puedan interferir (wpa_supplicant, etc.)..."
sudo airmon-ng check kill

echo "[*] Activando modo monitor en ${WIFI_IFACE}..."
sudo airmon-ng start "${WIFI_IFACE}"

# --------------------------------------------------------------
# NOTA: con el driver rtl8192cu, airmon-ng activa el modo monitor
# directamente sobre wlan0 (encabezados radiotap) sin crear una
# interfaz adicional como wlan0mon. Además, debido a limitaciones
# del driver, tcpdump no reconoce explícitamente el modo monitor
# con la opción -I, pero la captura funciona correctamente sin
# forzar dicho parámetro.
# --------------------------------------------------------------
