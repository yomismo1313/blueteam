#!/bin/bash
# ==============================================================
# 03 - Desactivación de servicios y ajustes de red
# --------------------------------------------------------------
# Garantiza que el bridge funcione de forma transparente:
#   - Detiene NetworkManager (evita que reasigne IP por DHCP
#     a las interfaces físicas integradas en el bridge).
#   - Desactiva el reenvío IP (el sistema no debe actuar como
#     router).
#   - Carga el módulo br_netfilter para que iptables/Snort
#     puedan inspeccionar el tráfico que atraviesa el bridge.
#   - Activa el filtrado de tráfico bridge en iptables/ip6tables.
# ==============================================================

set -e

echo "[*] Deteniendo NetworkManager..."
sudo systemctl stop NetworkManager
systemctl status NetworkManager --no-pager || true

echo "[*] Desactivando el reenvío IP (ip_forward)..."
echo 0 | sudo tee /proc/sys/net/ipv4/ip_forward

echo "[*] Cargando el módulo br_netfilter..."
sudo modprobe br_netfilter
# No muestra salida si el módulo se carga correctamente.

echo "[*] Activando el filtrado de tráfico bridge en iptables..."
sudo sysctl -w net.bridge.bridge-nf-call-iptables=1
sudo sysctl -w net.bridge.bridge-nf-call-ip6tables=1

echo "[*] Ajustes de red aplicados correctamente."
