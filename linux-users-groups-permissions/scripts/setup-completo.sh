#!/bin/bash
# ==============================================================
# setup-completo.sh - Orquesta todo el ejercicio en orden
# --------------------------------------------------------------
# Los pasos que crean ficheros dentro del home de un usuario
# concreto (04 a 10) deben ejecutarse como ESE usuario (su <user>)
# o adaptando las rutas/sudo según el caso. Revisa cada script
# antes de lanzarlo.
# ==============================================================

set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== 1. Grupos sistemas y desarrollo ==="
bash "${DIR}/01-crear-grupos.sh"

echo "=== 2. Usuarios Oliver y Tom (sistemas) ==="
bash "${DIR}/02-crear-usuarios-sistemas.sh"

echo "=== 3. Usuarias Carla y Sara (desarrollo) ==="
bash "${DIR}/03-crear-usuarios-desarrollo.sh"

echo ""
echo "Usuarios y grupos base creados."
echo "Los siguientes pasos crean ficheros en el home de cada"
echo "usuario y deben ejecutarse con su propia sesión (su <user>):"
echo "  04-passwords-privado.sh        (como oliver)"
echo "  05-ips-grupo-sistemas.sh       (como oliver)"
echo "  06-empleados-grupo-desarrollo.sh (como carla)"
echo "  07-grupo-rrhh.sh"
echo "  08-benji-onboarding.sh         (como benji)"
echo "  09-grupo-seguridad.sh          (como sara)"
echo "  10-grupo-normativa.sh          (como sara)"
