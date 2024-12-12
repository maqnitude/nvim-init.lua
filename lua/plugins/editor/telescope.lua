return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        event = { "VeryLazy" },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local builtin = require("telescope.builtin")

            local set_keymap = require("utils").set_keymap

            set_keymap("n", "<leader>ff", builtin.find_files, { desc = "[f]ind [f]files" })
            set_keymap("n", "<leader>fg", builtin.live_grep, { desc = "[f]ind [g]rep" })
            set_keymap("n", "<leader>fb", builtin.buffers, { desc = "[f]ind [b]uffers" })
            set_keymap("n", "<leader>fh", builtin.help_tags, { desc = "[f]ind [h]elp tags" })
        end
    },

    {
        "nvim-lua/plenary.nvim",
        lazy = true
    }
}
