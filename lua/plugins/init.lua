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
        end
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "williamboman/mason.nvim",
                config = function ()
                    -- TODO: move to ./plugins/configs
                    require("mason").setup({
                        ui = {
                            border = "single",
                        },
                    })
                end
            },
            {
                "williamboman/mason-lspconfig.nvim",
                opts = function ()
                    return require("plugins.configs.mason_lspconfig")
                end,
                config = function (_, opts)
                    local mason_lspconfig = require("mason-lspconfig")
                    mason_lspconfig.setup(opts.setup)
                    mason_lspconfig.setup_handlers(opts.handlers)
                end
            },
        },
        config = function ()
            -- TODO: move to ./plugins/configs
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
            vim.keymap.set('n', '<leader>dm', vim.diagnostic.open_float, { desc = "Open floating [d]iagnostic [m]essage" })
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
            vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = "Open [d]iagnostic [l]ist" })
        end
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        event = { "InsertEnter" },
        config = function ()
            require("nvim-autopairs").setup()
        end
    },

    -- Comment
    {
        "numToStr/Comment.nvim",
        event = { "BufNewFile", "BufReadPost" },
        config = function ()
            require("Comment").setup()
        end
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter" },
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
        config = function ()
            require("plugins.configs.cmp")
        end
    },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        config = function ()
            require("lualine").setup({
                options = {
                    theme = "auto",
                }
            })
        end
    },

    -- Colorscheme
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false,
        priority = 1000,
        config = function ()
            vim.cmd.colorscheme("moonfly")
            vim.g.moonflyNormalFloat = true
        end
    }
    -- {
    --     "Lokaltog/vim-monotone",
    --     config = function ()
    --         vim.cmd([[
    --             let g:monotone_secondary_hue_offset = 175
    --             let g:monotone_emphasize_comments = 1
    --         ]])
    --         vim.cmd.colorscheme("monotone")
    --         vim.cmd.highlight("MatchParen", "gui=reverse")
    --     end
    -- }
}
