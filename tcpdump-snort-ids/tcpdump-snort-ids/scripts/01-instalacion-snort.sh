#!/bin/bash
# ==============================================================
# 01 - Instalación de Snort
# --------------------------------------------------------------
# Instala Snort (en Kali se instala la versión 3, ya que Kali
# no distribuye la 2 directamente desde sus repositorios) y
# comprueba la versión instalada.
# ==============================================================

set -e

echo "[*] Instalando Snort..."
sudo apt update
sudo apt install -y snort

echo "[*] Versión instalada:"
snort -V

# --------------------------------------------------------------
# NOTA: durante la instalación es posible que apt detecte que
# /etc/snort/snort.lua ya existe y pregunte qué hacer con él:
#
#   Y -> Reemplazar tu archivo por el nuevo (pierdes cambios)
#   I -> Ver diferencias línea por línea
#   N -> Conservar tu archivo actual   <-- recomendado
#   O -> Abrir el archivo nuevo (sin instalarlo)
#   Z -> Abrir una shell
#
# Si tienes una configuración previa que no quieres perder,
# pulsa ENTER o escribe N.
# --------------------------------------------------------------
