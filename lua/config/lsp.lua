require'lspconfig'.clangd.setup{
    on_attach=on_attach,
    root_dir = function() return vim.loop.cwd() end
}

require'lspconfig'.pyls.setup{ on_attach=on_attach }

-- Diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {
            prefix = '--',
        },

        signs = true,

        update_in_insert = true,
    }
)

local opts = {
    highlight_hovered_item = true,
    show_guides = true,
}

