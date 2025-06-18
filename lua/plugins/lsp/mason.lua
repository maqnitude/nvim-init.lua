return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls"
            },
            automatic_enable = false
        },
        dependencies = {
            {
                "mason-org/mason.nvim",
                opts = {
                    ui = {
                        border = "rounded",
                    }
                }
            },
            "neovim/nvim-lspconfig",
        },
    }
}
