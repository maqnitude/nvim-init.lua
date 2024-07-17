return {
    -- Git/Github related
    {
        "tpope/vim-fugitive",
        cond = function ()
            return not vim.g.vscode
        end,
    },
    -- {
    --     "github/copilot.vim",
    --     event = { "BufNewFile", "BufReadPost" },
    -- },

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
        cond = function ()
            return not vim.g.vscode
        end
    },

    -- LSP
    {
        "williamboman/mason.nvim",
        event = { "VimEnter" },
        config = function ()
            require("mason").setup({
                ui = {
                    border = "single",
                },
            })
        end,
        cond = function ()
            return not vim.g.vscode
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = { "VimEnter" },
        opts = function ()
            return require("plugins.configs.mason_lspconfig")
        end,
        config = function (_, opts)
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup(opts.setup)
            mason_lspconfig.setup_handlers(opts.handlers)
        end,
        cond = function ()
            return not vim.g.vscode
        end
    },
    {
        "neovim/nvim-lspconfig",
        event = { "VimEnter" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim"
        },
        config = function ()
            require("plugins.configs.lspconfig")
        end,
        cond = function ()
            return not vim.g.vscode
        end
    },

    -- Debugger
    {
        "mfussenegger/nvim-dap",
        config = function ()
            require("plugins.configs.dap.adapters")
            require("plugins.configs.dap.configurations")
        end,
        cond = function ()
            return not vim.g.vscode
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        },
        config = function ()
            local dap = require("dap")
            local dapui = require("dapui")

            dap.listeners.before.attach.dapui_config = function()
              dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
              dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
              dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
              dapui.close()
            end
        end,
        cond = function ()
            return not vim.g.vscode
        end
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        event = { "InsertEnter" },
        config = function ()
            require("nvim-autopairs").setup()
        end,
        cond = function ()
            return not vim.g.vscode
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

    -- Indent guides
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost" },
        main = "ibl",
        opts = {},
        config = function ()
            require("ibl").setup()
        end,
        cond = function ()
            return not vim.g.vscode
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
        end,
        cond = function ()
            return not vim.g.vscode
        end
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.2",
        event = { "VimEnter" },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function ()
            require("telescope").setup()
            require("plugins.configs.telescope")
        end,
        cond = function ()
            return not vim.g.vscode
        end
    },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        event = { "BufReadPost" },
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
        end,
        cond = function ()
            return not vim.g.vscode
        end
    },

    -- Colorscheme
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function ()
    --         require("tokyonight").setup({
    --             style = "night",
    --             styles = {
    --                 comments = { italic = false },
    --             },
    --         })
    --
    --         vim.cmd [[ colorscheme tokyonight ]]
    --
    --         -- Transparent background
    --         local groups = { "Normal", "NormalFloat", "NormalNC", "VertSplit" }
    --         for _, group in ipairs(groups) do
    --             vim.api.nvim_set_hl(0, group, { bg = "none" })
    --         end
    --     end,
    --     cond = function ()
    --         return not vim.g.vscode
    --     end
    -- },
}
