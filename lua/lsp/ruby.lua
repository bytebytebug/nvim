
vim.lsp.config("ruby_lsp", {
    cmd = {
        "ruby-lsp",
    },
    filetypes = { 
        "ruby",
    },
    root_markers = {
        "Gemfile",
        ".git",
    },
})

vim.lsp.enable("ruby_lsp")

