#!/bin/bash
# ==============================================================
# 10 - Grupo normativa compartido por Tom y Sara
# --------------------------------------------------------------
# Crea el grupo normativa con Tom y Sara como integrantes, y un
# fichero normativa.txt en el home de Sara que solo ellos dos
# pueden leer y escribir (chmod 660).
# ==============================================================
set -e

sudo addgroup normativa
sudo adduser tom normativa
sudo adduser sara normativa

echo "[*] Creando normativa.txt..."
cd /home/sara
touch normativa.txt
chgrp normativa normativa.txt
chmod 660 normativa.txt

echo "[*] Permisos resultantes:"
ls -la normativa.txt
