

-- basic configs

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.breakindentopt = { "shift:4" }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showbreak = "↳"

vim.opt.completeopt = {
  "menu",
  "menuone",
  "noinsert",
  "noselect",
}

require("themes")
require("identation")

require("lsp.commands")
require("lsp.ruby")
require("lsp.typescript")
