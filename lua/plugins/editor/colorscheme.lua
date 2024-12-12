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

        -- "navarasu/onedark.nvim",
        -- lazy = false,
        -- priority = 1000,
        -- config = function()
        --     require("onedark").setup {
        --         style = "darker",
        --         transparent = true,
        --         code_style = {
        --             comments = "none"
        --         }
        --     }
        --     require("onedark").load()
        -- end

        -- "rebelot/kanagawa.nvim",
        -- lazy = false,
        -- priority = 1000,
        -- config = function()
        --     require("kanagawa").setup({
        --         transparent = true,
        --         commentStyle = { italic = false },
        --         keywordStyle = { italic = false },
        --         theme = "wave",
        --         background = {
        --             dark = "dragon",
        --             light = "lotus"
        --         }
        --     })
        --     vim.cmd.colorscheme("kanagawa")
        -- end

        "Mofiqul/vscode.nvim",
        lazy = false,
        priority = 1000,
        config = function ()
            require("vscode").setup({
                transparent= true,
                italic_comments = false
            })
            vim.cmd.colorscheme("vscode");
        end
    }
}
