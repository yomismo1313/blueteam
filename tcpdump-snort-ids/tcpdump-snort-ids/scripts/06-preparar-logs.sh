#!/bin/bash
# ==============================================================
# 06 - Preparar directorio de logs de Snort
# --------------------------------------------------------------
# Crea el directorio donde Snort guardará alertas y capturas, y
# asigna permisos al usuario actual.
# ==============================================================

set -e

LOGDIR="/var/log/snort"

echo "[*] Creando ${LOGDIR}..."
sudo mkdir -p "${LOGDIR}"

echo "[*] Asignando permisos a ${USER}..."
sudo chown -R "${USER}:${USER}" "${LOGDIR}"

echo "[*] Listo. Contenido de ${LOGDIR}:"
ls -la "${LOGDIR}"
