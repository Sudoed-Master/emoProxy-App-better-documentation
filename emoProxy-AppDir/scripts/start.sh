#!/bin/bash
set -e

cd "$HOME/emoProxy"

echo "[*] Starting docker stack"
docker compose up
