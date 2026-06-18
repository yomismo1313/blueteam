#!/bin/bash
# ==============================================================
# 08 - Usuario Benji (rrhh) y onboarding.txt
# --------------------------------------------------------------
# Crea a Benji en el grupo rrhh y un fichero onboarding.txt en su
# home con lectura para el resto de usuarios pero sin permiso de
# escritura para nadie excepto Benji (chmod 604 -> rw----r--).
# ==============================================================
set -e

sudo adduser benji
sudo adduser benji rrhh

echo "[*] Comprobación de grupo:"
groups benji

echo "[*] Creando onboarding.txt..."
cd /home/benji
touch onboarding.txt
chmod 604 onboarding.txt

echo "[*] Permisos resultantes:"
ls -la onboarding.txt
