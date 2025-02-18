return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                -- Essentials
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline",

                -- Desktop development
                "cmake",
                "cpp",
                "c_sharp",
                "python",

                -- Web & others
                "html",
                "css",
                "json",
                "xml",
                "javascript",
                "typescript",
                "tsx", -- for React JSX/TSX
                "angular",
                "razor",
            },
            sync_install = true,
            highlight = { enable = true },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end
    }
}
