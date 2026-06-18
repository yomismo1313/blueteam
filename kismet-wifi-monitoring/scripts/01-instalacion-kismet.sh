#!/bin/bash
# ==============================================================
# 01 - Instalación de Kismet y dependencias
# --------------------------------------------------------------
# Instala Kismet junto con sus plugins, aircrack-ng (para el modo
# monitor) y gpsd (geolocalización opcional de dispositivos).
# ==============================================================

set -e

echo "[*] Actualizando repositorios e instalando Kismet..."
sudo apt update
sudo apt install -y kismet kismet-plugins aircrack-ng gpsd

echo "[*] Añadiendo al usuario actual al grupo kismet..."
sudo usermod -a -G kismet "$USER"

echo ""
echo "[!] Es necesario abrir una nueva sesión de terminal para que"
echo "    el cambio de grupo tenga efecto, o ejecutar:"
echo "        newgrp kismet"
echo "    (también sirve cerrar sesión y volver a entrar, o reiniciar)."
