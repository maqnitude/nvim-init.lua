local function custom_keymaps(bufnr)
    local api = require "nvim-tree.api"
    local set_keymap = require("utils").set_keymap

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    set_keymap("n", "<leader>fe", api.tree.toggle, "[f]ile [e]xplorer")
end

return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {
            on_attach = custom_keymaps
        }
    },

    {
        "nvim-tree/nvim-web-devicons",
        lazy = true
    }
}
