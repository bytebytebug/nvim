-- Plugins
-- vim.cmd [[
--   call plug#begin()

--     Plug 'neovim/nvim-lspconfig'
--     Plug 'hrsh7th/nvim-cmp'
--     Plug 'hrsh7th/cmp-nvim-lsp'
--     Plug 'L3MON4D3/LuaSnip'
--     Plug 'saadparwaiz1/cmp_luasnip'
--     Plug 'preservim/nerdtree'

--   call plug#end()
-- ]]

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4


vim.lsp.config('ruby_lsp', {
  -- cmd = { 'ruby-lsp' },
  cmd = { "bundle", "exec", "ruby-lsp" },
  filetypes = { 'ruby' },
  root_markers = {'.git', 'Gemfile'}, 
})

vim.lsp.enable('ruby_lsp')


vim.lsp.config('ts_ls', {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = {'tsconfig.json', 'package.json', '.git'},
})

vim.lsp.enable('ts_ls')


vim.lsp.config('gopls', {
    cmd = { 'gopls' },  -- comando do servidor
    filetypes = { 'go', 'gomod' },  -- tipos de arquivo
    root_markers = {'.git', 'go.mod'},  -- arquivos que marcam a raiz do projeto
    settings = { 
        gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
        }
    }
})

vim.lsp.enable('gopls')


vim.lsp.config('pyright', {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = {'.git', 'pyproject.toml', 'setup.py'},
})

vim.lsp.enable('pyright')


vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition,  { buffer = bufnr })
    vim.keymap.set('n', 'K',  vim.lsp.buf.hover,       { buffer = bufnr })
    -- adicione mais se quiser
  end,
})


vim.api.nvim_create_user_command("LspSymbol", function()
  vim.lsp.buf.document_symbol()
end, {})


vim.api.nvim_create_user_command("LspRef", function()
  vim.lsp.buf.references()
end, {})


vim.api.nvim_create_user_command("LspDef", function()
  vim.lsp.buf.definition()
end, {})


vim.api.nvim_create_user_command("LspHover", function()
  vim.lsp.buf.hover()
end, {})


vim.api.nvim_create_user_command("LspDiagnostic", function()
  vim.diagnostic.open_float()
end, {})


local cmp = require('cmp')
local luasnip = require("luasnip")


cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
})

require("luasnip.loaders.from_lua").lazy_load({
  paths = "~/.config/nvim/lua/snippets"
})

vim.keymap.set({"i", "s"}, "<C-j>", function() require("luasnip").expand() end)
vim.keymap.set({"i", "s"}, "<C-k>", function() require("luasnip").jump(1) end)
vim.keymap.set({"i", "s"}, "<c-l>", function() require("luasnip").jump(-1) end)


require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,   
    additional_vim_regex_highlighting = false,
  },
  ensure_installed = {
    -- Linguagens Ruby
    "ruby",
    "rbs",        -- Ruby Signature Files
    "embedded_template", -- ERB interno (Neovim 0.10+)

    -- Infra de projetos Ruby
    "json",       -- gemspec, configs, bundler metadata
    "yaml",       -- Rails, Hanami,configs
    "toml",       -- .tool-versions, config, rubocop
    "bash",       -- bin/setup, scripts
    "lua",        -- se usa Neovim com lua (recomendado)
    "make",       -- Makefile de C-extensions
    "regex",      -- Highlight decente de regex Ruby

    -- Web (se usa Rails / Hanami / Roda)
    "html",       
    "css",
    "scss",
    "javascript",
    "typescript",
    "tsx",

    -- Testes
    "rst",        -- documentação, readmes
    "markdown",
    "markdown_inline",
  },
})

-- vim.cmd("colorscheme tokyonight-night")
-- vim.g.tokyonight_style = "night"


-- vim.opt.background = "dark" -- set this to dark or light
-- vim.cmd("colorscheme oxocarbon")

-- vim.cmd("colorscheme catppuccin-mocha")

-- vim.cmd("colorscheme moonfly")


-- Ajustes do tema
vim.g.tokyonight_style = "night"
vim.g.tokyonight_dark_float = false
vim.g.tokyonight_dark_sidebar = false
vim.g.tokyonight_lualine_bold = true
vim.g.tokyonight_bold = true

-- Carrega o tema
vim.cmd("colorscheme tokyonight-night")

-- Contraste extra manual
vim.api.nvim_set_hl(0, "Normal", { bg = "#060608" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "#101018" })

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#060608" })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#7aa2f7", bold = true })
