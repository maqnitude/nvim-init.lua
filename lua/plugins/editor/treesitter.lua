return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = {
                    -- essentials
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "markdown",
                    "markdown_inline",

                    -- standards
                    "cpp",
                    "c_sharp",
                    "python",

                    -- web & others
                    "html",
                    "css",
                    "json",
                    "xml",
                    "javascript",
                    "typescript",
                    "tsx", -- for React JSX/TSX
                },
                sync_install = true,
                highlight = { enable = true },
            }
        end
    }
}
