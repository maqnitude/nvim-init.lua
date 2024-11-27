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

    clangd = {
        root_dir = vim.uv.cwd()
    },
    pyright = {},

    ts_ls = {},
    angularls = {},
    eslint = {},
    html = {},
    cssls = {},

    omnisharp = {
        cmd = {
            "dotnet",
            vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll"
        },
        root_dir = vim.uv.cwd()
    },

    cmake = {
        root_dir = vim.uv.cwd()
    },
    jsonls = {},
    yamlls = {},
}

return {
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function ()
            require("mason").setup()
            require("mason-lspconfig").setup {
                ensure_installed = vim.tbl_keys(servers),
                handlers = {
                    function(server_name)
                        local server_config = {
                            capabilities = require("cmp_nvim_lsp").default_capabilities(
                                vim.lsp.protocol.make_client_capabilities()
                            ),
                            on_attach = function(_, bufnr)
                                -- Buffer local mappings.
                                -- See `:help vim.lsp.*` for documentation on any of the below functions
                                local set_keymap = require("utils").set_keymap

                                set_keymap('n', '<leader>rn', vim.lsp.buf.rename, "")
                                set_keymap({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, "")

                                set_keymap('n', 'gd', vim.lsp.buf.definition, "")
                                set_keymap('n', 'gD', vim.lsp.buf.declaration, "")
                                set_keymap('n', 'gi', vim.lsp.buf.implementation, "")
                                set_keymap('n', 'gr', vim.lsp.buf.references, "")
                                set_keymap('n', '<leader>D', vim.lsp.buf.type_definition, "")

                                set_keymap('n', 'K', vim.lsp.buf.hover, "")
                                set_keymap('n', '<leader>k', vim.lsp.buf.signature_help, "")

                                set_keymap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, "")
                                set_keymap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, "")
                                set_keymap('n', '<leader>wl', function()
                                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                                end, "")

                                -- Create a command `:Format` local to the LSP buffer
                                vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                                    vim.lsp.buf.format()
                                end, {})

                                -- Diagnostic config
                                vim.diagnostic.config({
                                    float = { border = "single" }
                                })

                                -- See `:help vim.diagnostic.*` for documentation on any of the below functions
                                set_keymap('n', '<leader>dm', vim.diagnostic.open_float, "Open floating [d]iagnostic [m]essage")
                                set_keymap('n', '[d', vim.diagnostic.goto_prev, "Go to previous diagnostic message")
                                set_keymap('n', ']d', vim.diagnostic.goto_next, "Go to next diagnostic message")
                                set_keymap('n', '<leader>dl', vim.diagnostic.setloclist, "Open [d]iagnostic [l]ist")
                            end,
                            handlers = {
                                ['textDocument/hover'] = vim.lsp.with(
                                    vim.lsp.handlers.hover, {
                                        border = "single"
                                    }
                                ),
                                ['textDocument/signatureHelp'] = vim.lsp.with(
                                    vim.lsp.handlers.signatureHelp, {
                                        border = "single"
                                    }
                                )
                            },
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
            }
        end
    },

    {
        "williamboman/mason.nvim",
        lazy = true,
        opts = {
            ui = {
                border = "single",
            }
        }
    },

    {
        "neovim/nvim-lspconfig",
        lazy = true
    },
}
