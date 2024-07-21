return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "VeryLazy",
        opts = {
            ensure_installed = {
                -- core
                "c",
                "lua",
                "vim",
                "vimdoc",

                -- standards
                "cpp",
                "c_sharp",
                "python",

                -- web & others
                "html",
                "css",
                "json",
                "javascript",
                "typescript",
                "tsx", -- for React JSX/TSX
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        },
        config = function (_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    }
}
