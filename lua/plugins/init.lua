return {
    -- Git related
    { "tpope/vim-fugitive" },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufNewFile", "BufReadPost" },
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
            vim.keymap.set('n', '<leader>dm', vim.diagnostic.open_float, { desc = "Open floating [d]iagnostic [m]essage" })
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
            vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = "Open [d]iagnostic [l]ist" })
        end,
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            -- Sources for nvim-cmp
            {
                "hrsh7th/cmp-nvim-lsp",
            },
            -- Snippet engine
            {
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
            },
        },
        config = function()
            require("plugins.configs.cmp")
        end
    },
}
