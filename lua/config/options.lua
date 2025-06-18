-- GENERAL --

vim.o.mouse = "a"
vim.opt.clipboard = { "unnamed", "unnamedplus" }
vim.o.termguicolors = true
vim.o.timeout = false
vim.opt.completeopt = { "menuone", "noinsert", "noselect", "preview" }

-- EDITOR --
vim.o.guicursor = "a:block-nCursor"
vim.o.cursorcolumn = false
vim.o.cursorline = true
vim.o.scrolloff = 10

vim.o.number = true
vim.o.relativenumber = true

vim.o.signcolumn = "yes"
vim.o.colorcolumn = "80"

vim.o.showmode = false

-- Save undo history
vim.o.undofile = true

-- Decrease update time
vim.o.updatetime = 250

vim.o.wrap = false
vim.o.smartindent = true
vim.o.breakindent = true

vim.o.hlsearch = true
vim.o.incsearch = true

-- Case-insensitive searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Preview substitutions live
vim.o.inccommand = "split"

-- Tabs
local filetype_tab_settings = {
    ["c"] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
    ["cpp"] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
    -- ["cs"] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },

    -- Config stuff
    ["txt"] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 }, -- cmake
    ["xml"] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
    ["json"] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },

    -- Web stuff
    ["markdown"] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
    ["html"] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
    ["htmldjango"] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
    ["css"] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
    ["javascript"] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
    ["javascriptreact"] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
    ["typescript"] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
    ["typescriptreact"] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
}

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

for filetype, settings in pairs(filetype_tab_settings) do
    vim.cmd(string.format("autocmd FileType %s setlocal tabstop=%s softtabstop=%s shiftwidth=%s",
        filetype, settings.tabstop, settings.softtabstop, settings.shiftwidth))
end

-- Default colorscheme
vim.cmd.colorscheme("lunaperche")

-- Transparent background
-- local groups = {
--     "Normal", "NormalFloat", "NormalNC", "VertSplit",
--     "NvimTreeNormal", "NvimTreeNormalNC", "NvimTreeEndOfBuffer"
-- }
-- for _, group in ipairs(groups) do
--     vim.api.nvim_set_hl(0, group, { bg = "none" })
-- end
