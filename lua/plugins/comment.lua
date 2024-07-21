return {
    {
        "numToStr/Comment.nvim",
        event = { "BufNewFile", "BufReadPost" },
        config = function ()
            require("Comment").setup()
        end
    }
}
