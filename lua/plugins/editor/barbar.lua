return {
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            animation = false,
            sidebar_filetypes = {
                NvimTree = true,
            },
        },
        config = function(_, opts)
            require("barbar").setup(opts)

            local set_keymap = require("utils").set_keymap

            set_keymap("n", "<A-,>", "<Cmd>BufferPrevious<CR>")
            set_keymap("n", "<A-.>", "<Cmd>BufferNext<CR>")

            set_keymap("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>")
            set_keymap("n", "<A->>", "<Cmd>BufferMoveNext<CR>")

            set_keymap("n", "<A-q>", "<Cmd>BufferClose<CR>")
        end
    }
}
