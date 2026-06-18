#!/bin/bash
# ==============================================================
# setup-completo.sh - Orquesta el laboratorio Kismet paso a paso
# --------------------------------------------------------------
# Tras la instalación (paso 1) es necesario abrir una nueva
# sesión de terminal antes de continuar con los pasos 2 y 3,
# para que el alta en el grupo "kismet" tenga efecto.
# ==============================================================

set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== 1. Instalación de Kismet ==="
bash "${DIR}/01-instalacion-kismet.sh"

echo ""
echo "Abre una nueva terminal (o ejecuta 'newgrp kismet') y continúa con:"
echo "  ${DIR}/02-modo-monitor-wifi.sh"
echo "  Copia config/kismet_site.conf.snippet a /etc/kismet/kismet_site.conf"
echo "  ${DIR}/03-iniciar-kismet.sh"
