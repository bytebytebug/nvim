

vim.api.nvim_create_user_command("LspInfo", function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })

    if #clients == 0 then
        print("No LSP attached to current buffer")
        return
    end

    for i, client in ipairs(clients) do
        print(string.format(
            "Active LSPs: %d.",
            #clients
        ))
        print(string.format(
            "LSP %d: id=%d, name=%s.",
            i,
            client.id,
            client.name
        ))
    end
end, {})


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


vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    
    vim.lsp.completion.enable(true, client.id, ev.buf, {
      autotrigger = true,
    })
  end,
})