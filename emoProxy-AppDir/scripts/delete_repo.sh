#!/bin/bash
set -e

TARGET="$HOME/emoProxy"

if [ -d "$TARGET" ]; then
	echo "[!] Deleting $TARGET"
	rm -rf "$TARGET"
	echo "[✓] Repo deleted"
else
	echo "[!] Repo does not exist"
fi
