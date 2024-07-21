return {
    {
        "nvim-lualine/lualine.nvim",
        event = { "BufNewFile", "BufReadPost" },
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
    }
}
