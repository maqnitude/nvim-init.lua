return {
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufNewFile", "BufReadPost" },
        main = "ibl",
        opts = {},
        config = function ()
            require("ibl").setup()
        end,
    },
}
