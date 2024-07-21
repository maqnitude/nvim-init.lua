return {
    {
        "windwp/nvim-ts-autotag",
        event = { "BufNewFile", "BufReadPost" },
        config = function ()
            require("nvim-ts-autotag").setup()
        end
    }
}
