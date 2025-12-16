#!/usr/bin/env bash

set -euo pipefail

echo "Install language servers"
npm install -g typescript typescript-language-server
npm install -g pyright
go install golang.org/x/tools/gopls@latest
gem install ruby-lsp
echo ""

bash install-plugin.sh lukas-reineke/indent-blankline.nvim  v3.9.0
bash install-plugin.sh bluz71/vim-moonfly-colors            master
bash install-plugin.sh catppuccin/nvim                      v1.11.0
bash install-plugin.sh nyoom-engineering/oxocarbon.nvim     main
bash install-plugin.sh folke/tokyonight.nvim                v4.14.1
bash install-plugin.sh nvim-treesitter/nvim-treesitter      v0.10.0
bash install-plugin.sh neovim/nvim-lspconfig                v2.5.0
bash install-plugin.sh hrsh7th/nvim-cmp                     v0.0.2
bash install-plugin.sh hrsh7th/cmp-nvim-lsp                 main
bash install-plugin.sh L3MON4D3/LuaSnip                     v2.4.1
bash install-plugin.sh saadparwaiz1/cmp_luasnip             master
bash install-plugin.sh preservim/nerdtree                   7.1.3
