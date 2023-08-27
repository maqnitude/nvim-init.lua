local plugins = {
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        opts = function ()
            return require("plugins.configs.treesitter")
        end,
        config = function (_, opts) 
            require("nvim-treesitter.configs").setup(opts)
        end
    },
}

local lazy_config = require("plugins.configs.lazy_nvim")

require("lazy").setup(plugins, lazy_config)
