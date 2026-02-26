#!/bin/bash
set -e

cd "$HOME/emoProxy"

echo "[*] Stopping compose"
docker compose down || true

echo "[*] Removing containers"
sudo docker rm -f emo-dns nginx-1 mitm-proxy 2>/dev/null || true

echo "[✓] Containers removed"
