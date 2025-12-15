local function on_attach(bufnr)
    local api = require("nvim-tree.api")
    local set_keymap = require("utils").set_keymap

    -- Default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- Custom mappings
    set_keymap("n", "<leader>fe", function()
        -- if api.tree.is_visible() then
        --     if api.tree.is_tree_buf() then
        --         api.tree.close()
        --     else
        --         api.tree.open()
        --     end
        -- else
        --     api.tree.open()
        -- end
        api.tree.open()
    end, { desc = "[f]ile [e]xplorer" })
end

return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        keys = {
            { "<leader>fe", function() require("nvim-tree.api").tree.toggle() end }
        },
        dependencies = {
            { "nvim-tree/nvim-web-devicons", lazy = true }
        },
        opts = {
            on_attach = on_attach,
            actions = {
                open_file = {
                    quit_on_open = false
                }
            }
        }
    },
}
