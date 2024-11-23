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
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("config.keymaps")
require("config.options")

-- Setup lazy.nvim
if not vim.g.vscode then
    require("lazy").setup({
        spec = {
            { import = "plugins" }
        },
        install = { colorscheme = { "habamax"} },
        ui = {
            border = "single"
        },
        -- checker = { enabled = true },
    })
end

-- Transparent background
-- local groups = {
--     "Normal", "NormalFloat", "NormalNC", "VertSplit",
--     "NvimTreeNormal", "NvimTreeNormalNC", "NvimTreeEndOfBuffer"
-- }
-- for _, group in ipairs(groups) do
--     vim.api.nvim_set_hl(0, group, { bg = "none" })
-- end
