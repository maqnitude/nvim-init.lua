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

    ts_ls = {},
    angularls = {},
    eslint = {},
    html = {},
    cssls = {},
    tailwindcss = {},

    omnisharp = {
        cmd = {
            "dotnet",
            vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll"
        },
        settings = {
            FormattingOptions = {
                EnableEditorConfigSupport = true,
                OrganizeImports = true
            },
            MsBuild = {
                LoadProjectOnDemand = true
            },
            RoslynExtensionsOptions = {
                EnableAnalyzersSupport = false,
                EnableImportCompletion = true,
                AnalyzeOpenDocumentsOnly = true,
            },
            Sdk = {
                IncludePrereleases = true,
            },
        },
    },

    cmake = {},
    jsonls = {},
    yamlls = {},
}

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

local lsp_on_attach = function(_, bufnr)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local set_keymap = require("utils").set_keymap

    set_keymap("n", "<leader>rn", vim.lsp.buf.rename,
        { buffer = bufnr, desc = "[r]e[n]ame" })
    set_keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,
        { buffer = bufnr, desc = "[c]ode [a]ction" })

    set_keymap("n", "gd", vim.lsp.buf.definition,
        { buffer = bufnr, desc = "[g]oto [d]efinition" })
    set_keymap("n", "gD", vim.lsp.buf.declaration,
        { buffer = bufnr, desc = "[g]oto [D]eclaration" })
    set_keymap("n", "gi", vim.lsp.buf.implementation,
        { buffer = bufnr, desc = "[g]oto [i]mplementation" })
    set_keymap("n", "gr", vim.lsp.buf.references,
        { buffer = bufnr, desc = "[g]oto [r]eferences" })
    set_keymap("n", "<leader>D", vim.lsp.buf.type_definition,
        { buffer = bufnr, desc = "[g]oto type [D]efinition" })

    set_keymap("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
    set_keymap("n", "<leader>k", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "" })

    set_keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { buffer = bufnr, desc = "" })
    set_keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder,
        { buffer = bufnr, desc = "" })
    set_keymap("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { buffer = bufnr, desc = "" })

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
    end, {})

    set_keymap("n", "<leader>F", vim.lsp.buf.format, { buffer = bufnr, desc = "[F]ormat" })

    -- Format before writing to file
    local ignored_buf = { "CMakeLists.txt" }
    local function is_ignored(buf)
        local fname = vim.api.nvim_buf_get_name(buf)
        local tail = vim.fn.fnamemodify(fname, ":t")
        return vim.tbl_contains(ignored_buf, tail)
    end

    local format_augroup = vim.api.nvim_create_augroup("FormatAugroup", {
        clear = true
    })

    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        group = format_augroup,
        pattern = { "*" },
        callback = function(event)
            if is_ignored(event.buf) then
                return
            end

            vim.lsp.buf.format()
        end
    })

    -- Diagnostic config
    vim.diagnostic.config({
        float = { border = "single" }
    })

    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    set_keymap("n", "<leader>dm", vim.diagnostic.open_float,
        { buffer = bufnr, desc = "Open floating [D]iagnostic [m]essage" })
    set_keymap("n", "[d", vim.diagnostic.goto_prev,
        { buffer = bufnr, desc = "Go to previous diagnostic message" })
    set_keymap("n", "]d", vim.diagnostic.goto_next,
        { buffer = bufnr, desc = "Go to next diagnostic message" })
    set_keymap("n", "<leader>dl", vim.diagnostic.setloclist,
        { buffer = bufnr, desc = "Open [D]iagnostic [l]ist" })
end

return {
    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup {
                ensure_installed = vim.tbl_keys(servers),
                automatic_installation = true
            }
            require("mason-lspconfig").setup_handlers {
                function(server_name)
                    local server_config = {
                        root_dir = vim.uv.cwd(),
                        capabilities = lsp_capabilities,
                        on_attach = lsp_on_attach,
                        handlers = {
                            ["textDocument/hover"] = vim.lsp.with(
                                vim.lsp.handlers.hover, {
                                    border = "single"
                                }
                            ),
                            ["textDocument/signatureHelp"] = vim.lsp.with(
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
        end
    },

    {
        "neovim/nvim-lspconfig",
        lazy = true
    }
}
