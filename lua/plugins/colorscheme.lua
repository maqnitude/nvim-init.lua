return {
    {
        -- "shaunsingh/nord.nvim",
        -- lazy = false,
        -- priority = 1000,
        -- config = function()
        --     vim.g.nord_contrast = true
        --     vim.g.nord_disable_background = true
        --     vim.g.nord_italic = false
        --
        --     require("nord").set()
        -- end

        -- "baliestri/aura-theme",
        -- lazy = false,
        -- priority = 1000,
        -- config = function(plugin)
        --   vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
        --   vim.cmd([[colorscheme aura-dark]])
        -- end

        "navarasu/onedark.nvim",
        lazy = false,
        priority = 100,
        config = function()
            require("onedark").setup({
                style = "darker"
            })
            vim.cmd([[colorscheme onedark]])
        end
    }
}
