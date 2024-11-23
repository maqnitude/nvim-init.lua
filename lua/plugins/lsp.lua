local is_windows = vim.loop.os_uname().version:match("Windows")
local omnisharp_cmd = {}

if is_windows then
    local omnisharp_bin = "D:\\libs\\language-servers\\omnisharp-win-x64\\OmniSharp.exe"
    omnisharp_cmd = {
        omnisharp_bin,
        "--languageserver",
        "--hostPID", tostring(vim.fn.getpid()),
        "sdk:path=\"C:\\Program Files\\dotnet\\sdk\\8.0.400\"",
        "sdk:version=\"8.0.400\""
    }
else
    omnisharp_cmd = {}
end

local servers = {
    lua_ls = {
        settings = {
            Lua = {
                workspace = { checkThirdParty = false },
                diagnostics = {
                    globals = { "vim" }
                }
            }
        }
    },

    clangd = {},
    pyright = {},

    angularls = {},
    eslint = {},
    html = {},
    cssls = {},

    omnisharp = {
        cmd = omnisharp_cmd
    },

    -- cmake = {},
    jsonls = {},
    yamlls = {},
}

local setup = {
    ensure_installed = vim.tbl_keys(servers)
}

local on_attach = function (_, bufnr)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = bufnr }

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, opts)

    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function ()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function (_)
        vim.lsp.buf.format()
    end, {})
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

local handlers = {
    function (server_name)
        local server_config = {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = (servers[server_name] or {}).settings,
            filetypes = (servers[server_name] or {}).filetypes,
        }

        -- Server-specific configurations
        if servers[server_name] then
            for k, v in pairs(servers[server_name]) do
                server_config[k] = v
            end
        end

        require("lspconfig")[server_name].setup(server_config)
    end
}

return {
    {
        "williamboman/mason.nvim",
        lazy = true,
        config = function ()
            require("mason").setup({
                ui = {
                    border = "single",
                },
            })
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
        dependencies = {
            "williamboman/mason.nvim"
        },
        opts = {
            setup = setup,
            on_attach = on_attach,
            capabilities = capabilities,
            handlers = handlers
        },
        config = function (_, opts)
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup(opts.setup)
            mason_lspconfig.setup_handlers(opts.handlers)
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim"
        },
        config = function ()
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
        end,
    },
}
