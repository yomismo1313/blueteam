#!/bin/bash
# ==============================================================
# 01 - Crear los grupos sistemas y desarrollo
# ==============================================================
set -e

sudo addgroup sistemas
sudo addgroup desarrollo

echo "[*] Grupos creados:"
cat /etc/group | grep -E "sistemas|desarrollo"
