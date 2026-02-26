#!/bin/bash
set -e

echo "[*] Detecting operating system…"

if [ -r /etc/os-release ]; then
	. /etc/os-release
else
	echo "[!] Cannot detect OS (no /etc/os-release)"
	exit 1
fi

OS_ID="${ID,,}"
OS_LIKE="${ID_LIKE,,}"

echo "[*] OS detected: $NAME"
echo "[*] Based on: $OS_LIKE"

install_debian() {
	echo "[*] Installing dependencies (Debian-based)"

	pkexec bash -c "
	apt update
	apt install -y \
		git \
		openssl \
		curl \
		docker.io \
		docker-compose \
		golang

	systemctl enable docker
	systemctl start docker
	usermod -aG docker $USER
	"
}

install_arch() {
	echo "[*] Installing dependencies (Arch-based)"

	pkexec bash -c "
	pacman -Sy --noconfirm \
		git \
		openssl \
		curl \
		docker \
		docker-compose \
		go

	systemctl enable docker
	systemctl start docker
	usermod -aG docker $USER
	"
}

install_fedora() {
	echo "[*] Installing dependencies (Fedora-based)"

	pkexec bash -c "
	dnf install -y \
		git \
		openssl \
		curl \
		docker \
		docker-compose \
		golang

	systemctl enable docker
	systemctl start docker
	usermod -aG docker $USER
	"
}

install_opensuse() {
	echo "[*] Installing dependencies (openSUSE)"

	pkexec bash -c "
	zypper refresh
	zypper install -y \
		git \
		openssl \
		curl \
		docker \
		docker-compose \
		go

	systemctl enable docker
	systemctl start docker
	usermod -aG docker $USER
	"
}

case "$OS_ID" in
	debian|ubuntu|linuxmint|pop)
		install_debian
		;;
	arch|manjaro|endeavouros)
		install_arch
		;;
	fedora)
		install_fedora
		;;
	opensuse*|suse)
		install_opensuse
		;;
	*)
		if [[ "$OS_LIKE" == *debian* ]]; then
			install_debian
		elif [[ "$OS_LIKE" == *arch* ]]; then
			install_arch
		elif [[ "$OS_LIKE" == *fedora* ]]; then
			install_fedora
		elif [[ "$OS_LIKE" == *suse* ]]; then
			install_opensuse
		else
			echo "[!] Unsupported distribution"
			echo "[!] ID=$OS_ID"
			echo "[!] ID_LIKE=$OS_LIKE"
			exit 1
		fi
		;;
esac

echo "[✓] Dependencies installed successfully"
echo "[!] You may need to log out and log back in for Docker permissions to apply"
