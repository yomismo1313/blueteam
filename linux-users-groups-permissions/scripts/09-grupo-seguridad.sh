#!/bin/bash
# ==============================================================
# 09 - Grupo seguridad y vulnerabilidades.txt (solo Sara)
# --------------------------------------------------------------
# Crea el grupo seguridad con Sara como única integrante, y un
# fichero vulnerabilidades.txt que solo ella (propietaria) y el
# grupo seguridad pueden leer y escribir (chmod 660).
# Como Sara es la única miembro del grupo, en la práctica el
# fichero queda restringido exclusivamente a ella.
# ==============================================================
set -e

sudo addgroup seguridad
sudo adduser sara seguridad

echo "[*] Creando vulnerabilidades.txt..."
cd /home/sara
touch vulnerabilidades.txt
chgrp seguridad vulnerabilidades.txt
chmod 660 vulnerabilidades.txt

echo "[*] Permisos resultantes:"
ls -la vulnerabilidades.txt
