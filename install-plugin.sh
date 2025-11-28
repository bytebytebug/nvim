#!/usr/bin/env bash

# Uso:
#   ./install-nvim-plugin.sh user/repo [tag]
#
# Se tag não for passada → instala "main".
# Exemplo:
#   ./install-nvim-plugin.sh hrsh7th/nvim-cmp v0.0.1
#   ./install-nvim-plugin.sh L3MON4D3/LuaSnip
#   ./install-nvim-plugin.sh neovim/nvim-lspconfig

set -e

FULL="$1"
TAG="$2"

if [ -z "$FULL" ]; then
    echo "Uso: $0 user/repo [tag]"
    exit 1
fi

# Extrair USER e REPO do formato user/repo
USER="${FULL%%/*}"
REPO="${FULL##*/}"

# padrão para tag/branch
if [ -z "$TAG" ]; then
    TAG="main"
fi

DEST="$HOME/.config/nvim/pack/vendor/start/$REPO"

echo "==> Instalando https://github.com/$USER/$REPO ($TAG) "
echo "Destino: $DEST"

# remover instalação antiga
if [ -d "$DEST" ]; then
    echo "→ Removendo versão anterior..."
    rm -rf "$DEST"
fi

# clonar com branch/tag
echo "→ Clonando..."
git -c advice.detachedHead=false  clone -b "$TAG" -q "https://github.com/$USER/$REPO" "$DEST" >/dev/null

echo "✓ Plugin instalado com sucesso!"
echo ""