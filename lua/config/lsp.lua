vim.lsp.config("*", {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            }
        }
    },
    root_markers = { ".git" }
})

vim.lsp.enable("lua_ls")

-- Override defaults
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspAugroup", {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        local set_keymap = require("utils").set_keymap

        if client:supports_method("textDocument/hover") then
            set_keymap("n", "K", function()
                vim.lsp.buf.hover({ border = "rounded" })
            end, { buffer = args.buf })
        end

        -- Enable LSP-driven auto-completion
        if client:supports_method("textDocument/completion") then
            -- Trigger completion on every character
            local chars = {}
            for i = 32, 126 do table.insert(chars, string.char(i)) end
            client.server_capabilities.completionProvider.triggerCharacters = chars

            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })

            local set_keymap = require("utils").set_keymap

            -- Enter can also accept completion
            set_keymap("i", "<CR>", function()
                return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
            end, { expr = true })

            -- Tab and Shift+Tab can also navigate the items
            set_keymap("i", "<Tab>", function()
                return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
            end, { expr = true })
            set_keymap("i", "<S-Tab>", function()
                return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
            end, { expr = true })
        end

        if client:supports_method("textDocument/formatting") then
            local format = function()
                vim.lsp.buf.format({
                    bufnr = args.buf,
                    id = client.id,
                    timeout_ms = 1000
                })
            end

            -- Manual formatting
            set_keymap("n", "<leader>F", format, { buffer = args.buf })

            -- Auto-format (lint) on save
            if not client:supports_method("textDocument/willSaveWaitUntil") then
                vim.api.nvim_create_autocmd({ "BufWritePre" }, {
                    group = vim.api.nvim_create_augroup("LspAugroup", { clear = false }),
                    buffer = args.buf,
                    callback = format
                })
            end
        end
    end
})
