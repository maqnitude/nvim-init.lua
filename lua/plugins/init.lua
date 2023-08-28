return {
    -- Git related
    { "tpope/vim-fugitive" },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = function ()
            return require("plugins.configs.treesitter")
        end,
        config = function (_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "williamboman/mason.nvim",
                config = function()
                    require("mason").setup()
                end
            },
            {
                "williamboman/mason-lspconfig.nvim",
                opts = function()
                    return require("plugins.configs.mason_lspconfig")
                end,
                config = function(_, opts)
                    local mason_lspconfig = require("mason-lspconfig")
                    mason_lspconfig.setup(opts.setup)
                    mason_lspconfig.setup_handlers(opts.handlers)
                end
            },
        },
        config = function()
            -- Diagnostic keymaps
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist)
        end,
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            -- Snippet engine
            { "L3MON4D3/LuaSnip" },

            -- Sources for nvim-cmp & snippet engine
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lsp",
            },
        },
    },
}
