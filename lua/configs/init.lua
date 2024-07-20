require("configs.options")
require("configs.keymaps")

-- Netrw settings
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0

-- Colorscheme & Highlighting
-- ['blue', 'darkblue', 'default', 'delek', 'desert', 'elflord', 'evening',
-- 'habamax', 'industry', 'koehler', 'lunaperche', 'morning', 'murphy',
-- 'pablo', 'peachpuff', 'quiet', 'retrobox', 'ron', 'shine', 'slate',
-- 'sorbet', 'torte', 'vim', 'wildcharm', 'zaibatsu', 'zellner']
vim.cmd [[ colorscheme default ]]

-- Transparent background
local groups = { "Normal", "NormalFloat", "NormalNC", "VertSplit" }
for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none" })
end
