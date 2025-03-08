-- Disable netrw to use nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner = 0

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("config.keymaps")
require("config.options")
require("config.autocmds")

-- Setup lazy.nvim
require("lazy").setup({
    defaults = {
        lazy = false,
        cond = not vim.g.vscode,
    },
    spec = {
        { import = "plugins" },
        { import = "plugins.editor" },
        { import = "plugins.lsp" },
        { import = "plugins.dap" }
        -- { import = "plugins.extra" },
    },
    ui = {
        border = "single"
    },
    checker = { enabled = false }
})
