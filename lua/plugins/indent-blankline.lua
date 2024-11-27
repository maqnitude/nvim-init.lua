return {
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = true;
        event = { "BufReadPost", "BufNewFile" },
        main = "ibl",
        opts = {}
    },
}
