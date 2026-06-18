#!/bin/bash
# ==============================================================
# 02 - Preparación de interfaces y creación del bridge (br0)
# --------------------------------------------------------------
# Elimina cualquier IP de las interfaces físicas y las une en un
# bridge de capa 2 (br0) para que Snort pueda inspeccionar el
# tráfico de forma transparente, sin actuar como router.
#
# Edita las variables IFACE1 / IFACE2 según tus interfaces reales.
# ==============================================================

set -e

IFACE1="eth0"
IFACE2="eth1"
BRIDGE="br0"

echo "[*] Limpiando direcciones IP de ${IFACE1} y ${IFACE2}..."
sudo ip addr flush dev "${IFACE1}"
sudo ip addr flush dev "${IFACE2}"

echo "[*] Creando el bridge ${BRIDGE}..."
sudo brctl addbr "${BRIDGE}"
sudo brctl addif "${BRIDGE}" "${IFACE1}"
sudo brctl addif "${BRIDGE}" "${IFACE2}"

echo "[*] Levantando interfaces..."
sudo ip link set "${IFACE1}" up
sudo ip link set "${IFACE2}" up
sudo ip link set "${BRIDGE}" up

echo "[*] Estado de las interfaces (deben aparecer UP y sin IP):"
ip a

echo "[*] Comprobación del bridge:"
brctl show
