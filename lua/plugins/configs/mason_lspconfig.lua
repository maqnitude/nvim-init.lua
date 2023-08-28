local servers = {
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            diagnostics = {
                globals = { "vim" }
            }
        }
    },
}

local M = {}

M.setup = {
    ensure_installed = vim.tbl_keys(servers)
}

M.handlers = {
    function(server_name)
        local lspconfig = require("plugins.configs.lspconfig")
        require("lspconfig")[server_name].setup {
            capabilities = lspconfig.capabilities,
            on_attach = lspconfig.on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
        }
    end
}

return M
