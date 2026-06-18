#!/bin/bash
# ==============================================================
# 03 - Inicio de Kismet
# --------------------------------------------------------------
# Lanza Kismet sobre la interfaz en modo monitor y expone la
# interfaz web en el puerto 2501.
# ==============================================================

set -e

WIFI_IFACE="wlan0"

echo "[*] Iniciando Kismet sobre ${WIFI_IFACE}..."
sudo kismet -c "${WIFI_IFACE}" --no-ncurses

# --------------------------------------------------------------
# Una vez iniciado, el servidor web queda escuchando en
# 0.0.0.0:2501. Accede desde el navegador a:
#
#     http://localhost:2501/
#
# e introduce las credenciales definidas en kismet_site.conf
# (httpd_username / httpd_password).
# --------------------------------------------------------------
