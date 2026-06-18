#!/bin/bash
# ==============================================================
# 04 - passwords.txt privado del usuario Oliver
# --------------------------------------------------------------
# Fichero en el home de Oliver al que solo él tiene acceso de
# lectura y escritura (chmod 600 -> rw-------).
#
# Ejecutar como el propio usuario (su oliver) o adaptar la ruta.
# ==============================================================
set -e

cd /home/oliver
touch passwords.txt
chmod 600 passwords.txt

echo "[*] Permisos resultantes:"
ls -la passwords.txt
