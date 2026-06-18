#!/bin/bash
# ==============================================================
# 02 - Crear los usuarios Oliver y Tom (grupo sistemas)
# --------------------------------------------------------------
# adduser pedirá contraseña y datos opcionales (Full Name, Room
# Number, etc.) de forma interactiva para cada usuario.
# ==============================================================
set -e

sudo adduser oliver
sudo adduser tom

echo "[*] Añadiendo oliver y tom al grupo sistemas..."
sudo adduser oliver sistemas
sudo adduser tom sistemas

echo "[*] Comprobación de grupos:"
groups oliver tom
