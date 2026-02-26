#!/bin/bash
set -e

APPDIR="$HOME/emoProxy"
REPODIR="$APPDIR/Proxy"

REPO1="https://github.com/emo-libre/emo-proxy-docker.git"
REPO2="https://github.com/emo-libre/Proxy.git"

EXAMPLECONF="$REPODIR/emoProxy.conf.example"
CONF="$REPODIR/emoProxy.conf"

echo "[*] Creating base directory"
mkdir -p "$APPDIR"

if [ ! -d "$APPDIR/.git" ]; then
	echo "[*] Cloning docker repo"
	git clone "$REPO1" "$APPDIR"
else
	echo "[!] Docker repo already exists, skipping"
fi

if [ ! -d "$REPODIR/.git" ]; then
	echo "[*] Cloning proxy repo"
	git clone "$REPO2" "$REPODIR"
else
	echo "[!] Proxy repo already exists, skipping"
fi

if [ ! -f "$CONF" ]; then
	echo "[*] Creating config"
	cp "$EXAMPLECONF" "$CONF"
	sed -i 's/#.*//' "$CONF"
fi

echo "[*] Generating SSL certs"
mkdir -p "$APPDIR/nginx/ssl"

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout "$APPDIR/nginx/ssl/server.key" \
	-out "$APPDIR/nginx/ssl/server.crt" \
	-subj "/CN=api.living.ai"

echo "[✓] Clone complete"
