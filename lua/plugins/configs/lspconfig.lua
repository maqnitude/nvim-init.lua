-- Border on floating windows
local border = "single"

require('lspconfig.ui.windows').default_options.border = border

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = border
    }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signatureHelp, {
        border = border
    }
)
vim.diagnostic.config({
    float = { border = border }
})

-- Diagnostic keymaps
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>dm', vim.diagnostic.open_float,
    { desc = "Open floating [d]iagnostic [m]essage" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev,
    { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next,
    { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist,
    { desc = "Open [d]iagnostic [l]ist" })
