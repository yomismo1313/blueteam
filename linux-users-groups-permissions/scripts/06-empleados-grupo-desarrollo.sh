#!/bin/bash
# ==============================================================
# 06 - empleados.txt: lectura para todos, escritura para desarrollo
# --------------------------------------------------------------
# Fichero creado por Carla en su home: cualquier usuario puede
# leerlo, pero solo los miembros del grupo desarrollo (Carla y
# Sara) pueden modificarlo (chmod 664 -> rw-rw-r--).
#
# Ejecutar como el usuario carla.
# ==============================================================
set -e

cd /home/carla
touch empleados.txt
chmod 664 empleados.txt
chgrp desarrollo empleados.txt

echo "[*] Permisos resultantes:"
ls -la empleados.txt
