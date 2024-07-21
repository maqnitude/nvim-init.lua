return {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.nord_contrast = true
        -- vim.g.nord_disable_background = true
        vim.g.nord_italic = false

        require("nord").set()
    end
}
