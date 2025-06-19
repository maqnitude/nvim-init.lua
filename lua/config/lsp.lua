-- Common config
vim.lsp.config("*", {
    root_markers = { ".git" }
})

-- Enable language servers (or tell mason-lspconfig to auto-enable)
vim.lsp.enable("lua_ls")

-- Override defaults and remaps
local set_keymap = require("utils").set_keymap

local function configure_lsp(client, bufnr)
    set_keymap("n", "<leader>rn", vim.lsp.buf.rename,
        { buffer = bufnr, desc = "[r]e[n]ame" })
    set_keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,
        { buffer = bufnr, desc = "[c]ode [a]ction" })

    set_keymap("n", "gd", vim.lsp.buf.definition,
        { buffer = bufnr, desc = "[g]o to [d]efinition" })
    set_keymap("n", "gD", vim.lsp.buf.declaration,
        { buffer = bufnr, desc = "[g]o to [D]eclaration" })
    set_keymap("n", "gi", vim.lsp.buf.implementation,
        { buffer = bufnr, desc = "[g]o to [i]mplementation" })
    set_keymap("n", "gr", vim.lsp.buf.references,
        { buffer = bufnr, desc = "[g]o to [r]eferences" })
    set_keymap("n", "gt", vim.lsp.buf.type_definition,
        { buffer = bufnr, desc = "[g]o to [t]ype definition" })

    if client:supports_method("textDocument/hover") then
        set_keymap("n", "K", function()
            vim.lsp.buf.hover({ border = "rounded" })
        end, { buffer = bufnr })
    end

    if client:supports_method("textDocument/signatureHelp") then
        set_keymap("n", "<leader>k", function()
            vim.lsp.buf.signature_help({ border = "rounded" })
        end, { buffer = bufnr })
    end

    if client:supports_method("textDocument/formatting") then
        local function format()
            vim.lsp.buf.format({
                bufnr = bufnr,
                id = client.id,
                timeout_ms = 1000
            })
        end

        -- Manual formatting
        set_keymap("n", "<leader>F", format, { buffer = bufnr })

        -- Auto-format (lint) on save
        if not client:supports_method("textDocument/willSaveWaitUntil") then
            vim.api.nvim_create_autocmd({ "BufWritePre" }, {
                group = vim.api.nvim_create_augroup("LspAugroup", { clear = false }),
                buffer = bufnr,
                callback = format
            })
        end
    end
end

local function configure_diagnostic(bufnr)
    vim.diagnostic.config({
        float = { border = "rounded" }
    })

    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    set_keymap("n", "<leader>dm", vim.diagnostic.open_float,
        { buffer = bufnr, desc = "Open floating [d]iagnostic [m]essage" })
    set_keymap("n", "]d", function()
        vim.diagnostic.jump({ count = 1, float = true })
    end, { buffer = bufnr, desc = "Go to next diagnostic message" })
    set_keymap("n", "[d", function()
        vim.diagnostic.jump({ count = -1, float = true })
    end, { buffer = bufnr, desc = "Go to previous diagnostic message" })
    set_keymap("n", "<leader>dl", vim.diagnostic.setloclist,
        { buffer = bufnr, desc = "Open [d]iagnostic [l]ist" })
end

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspAugroup", {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        configure_lsp(client, args.buf)
        configure_diagnostic(args.buf)
    end
})
