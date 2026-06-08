
vim.lsp.config("typescript_lsp", {
    cmd = {
        "typescript-language-server",
        "--stdio",
    },
    filetypes = { 
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },
    root_markers = {
        "tsconfig.json",
        "package.json",
        ".git",
    },
})

vim.lsp.enable("typescript_lsp")

