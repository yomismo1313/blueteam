#!/bin/bash
# ==============================================================
# 07 - Grupo rrhh, usuaria Pepa y traspaso de empleados.txt
# --------------------------------------------------------------
# Crea el grupo rrhh, añade a Pepa, y reasigna el grupo
# propietario de empleados.txt de "desarrollo" a "rrhh".
# ==============================================================
set -e

sudo adduser pepa
sudo addgroup rrhh
sudo adduser pepa rrhh

echo "[*] Comprobación de grupo:"
groups pepa

echo "[*] Reasignando grupo de empleados.txt a rrhh..."
sudo chgrp rrhh /home/carla/empleados.txt
