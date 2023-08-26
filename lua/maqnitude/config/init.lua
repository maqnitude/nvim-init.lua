require("maqnitude.config.options")
require("maqnitude.config.keymaps")

-- Netrw settings
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0

-- Colorscheme & Highlighting
vim.cmd.colorscheme("habamax")
vim.cmd.highlight("MatchParen", "gui=bold")
