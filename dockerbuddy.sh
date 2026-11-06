#!/bin/bash

# readlink -f resolve o symlink, para achar a pasta data/ mesmo rodando via ~/.local/bin
DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

# Cores ANSI
BOLD=$'\e[1m'; CYAN=$'\e[1;36m'; YELLOW=$'\e[1;33m'; DIM=$'\e[2m'; RESET=$'\e[0m'

# Imprime o .txt colorindo títulos (====), seções (-- x --) e comentários (# ...)
show() {
    sed -E \
        -e "s/^(=+.*=+)$/${CYAN}\1${RESET}/" \
        -e "s/^(-- .* --)$/${YELLOW}\1${RESET}/" \
        -e "s/^([^#]*[^ #])( +#.*)$/${BOLD}\1${RESET}${DIM}\2${RESET}/" \
        "$DIR/data/$1.txt"
}

containers() {
    show containers
}

images() {
    show images
}

volumes() {
    show volumes
}

networks() {
    show networks
}

compose() {
    show compose
}

filters() {
    show filters
}

# Menu
echo "       DOCKER BUDDY"
echo ""
echo "[1] Containers"
echo "[2] Images"
echo "[3] Volumes"
echo "[4] Networks"
echo "[5] Docker Compose"
echo "[6] Filtros (docker ps)"
echo ""

read -rp "Selecione uma opção: " option

case "$option" in
    1) containers ;;
    2) images ;;
    3) volumes ;;
    4) networks ;;
    5) compose ;;
    6) filters ;;
    *) echo "Opção inválida!" ;;
esac
