#!/bin/bash
# ==============================================================
# 03 - Crear los usuarios Carla y Sara (grupo desarrollo)
# ==============================================================
set -e

sudo adduser carla
sudo adduser sara

echo "[*] Añadiendo carla y sara al grupo desarrollo..."
sudo adduser sara desarrollo
sudo adduser carla desarrollo

echo "[*] Comprobación de grupos:"
groups carla sara
