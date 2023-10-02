return {
    -- Git related
    { "tpope/vim-fugitive" },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        cond = function ()
            return not vim.g.vscode
        end,
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
            require("plugins.configs.lspconfig")
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

    -- Telescope
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.2",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function ()
            require("telescope").setup()
            require("plugins.configs.telescope")
        end
    },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function ()
            require("lualine").setup({
                options = {
                    icons_enabled = true,
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
            vim.cmd.highlight({"Comment", "cterm=NONE", "gui=NONE"})
            vim.g.moonflyNormalFloat = true
        end
    }
}
