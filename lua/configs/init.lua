require("configs.options")
require("configs.keymaps")

-- Netrw settings
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0

-- Colorscheme & Highlighting
-- vim.cmd.colorscheme("habamax")
-- vim.cmd.highlight("MatchParen", "gui=bold")

-- Transparent background
local groups = { "Normal", "NormalFloat", "NormalNC", "VertSplit" }
for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none" })
end
