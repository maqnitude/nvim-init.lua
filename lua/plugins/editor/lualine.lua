return {
    {
        "nvim-lualine/lualine.nvim",
        event = { "VimEnter" },
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {
            options = {
                icons_enabled = true,
                theme = "auto",
            }
        }
    }
}
