#!/bin/bash
set -e

cd "$HOME/emoProxy"

echo "[*] Stopping docker stack"
docker compose down

echo "[*] Killing port 8080 if used"
sudo fuser -k 8080/tcp || true
