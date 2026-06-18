#!/bin/bash
# ==============================================================
# 05 - ips.txt compartido por el grupo sistemas
# --------------------------------------------------------------
# Fichero creado por Oliver en su home, con lectura y escritura
# para el grupo sistemas (chmod 660 -> rw-rw----), de forma que
# Tom (también en sistemas) pueda leerlo y escribirlo, mientras
# que Carla y Sara (grupo desarrollo) no tienen acceso.
#
# Ejecutar como el usuario oliver.
# ==============================================================
set -e

cd /home/oliver
touch ips.txt
chgrp sistemas ips.txt
chmod 660 ips.txt

echo "[*] Permisos resultantes:"
ls -la ips.txt
