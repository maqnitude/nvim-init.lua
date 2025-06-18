return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        branch = "main",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup()
            require("nvim-treesitter").install({
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
                "sql"
            })
        end
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        event = { "BufReadPre", "BufNewFile" },
        opts = {}
    }
}
