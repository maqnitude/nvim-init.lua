-- GENERAL --

vim.opt.mouse = "a"
vim.opt.clipboard = { "unnamed", "unnamedplus" }
vim.opt.termguicolors = true
vim.opt.timeout = false
vim.opt.completeopt = { "menu", "menuone", "preview", "noselect" }

-- EDITOR --

vim.opt.guicursor = "a:block-nCursor"
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.scrolloff = 10

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

vim.opt.showmode = false

-- Save undo history
vim.opt.undofile = true

-- Decrease update time
vim.opt.updatetime = 250

vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Case-insensitive searching
vim.opt.ignorecase =true
vim.opt.smartcase = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live
vim.opt.inccommand = "split"

-- Tabs
local filetype_settings = {
    ['md'] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },

    ['html'] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
    ['htmldjango'] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
    ['css'] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },

    ['xml'] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
    ['json'] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },

    ['javascript'] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
    ['javascriptreact'] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
    ['typescript'] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
    ['typescriptreact'] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
}

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

for filetype, settings in pairs(filetype_settings) do
    vim.cmd(string.format("autocmd FileType %s setlocal tabstop=%s softtabstop=%s shiftwidth=%s",
                          filetype, settings.tabstop, settings.softtabstop, settings.shiftwidth))
end

-- Highlight trailing whitespace in red
function highlight_trailing_whitespace()
    vim.cmd([[match ExtraWhitespace /\s\+$/]])
    vim.cmd([[highlight ExtraWhitespace guifg=#ff0000 guibg=#ff0000]])
end

vim.cmd([[autocmd CursorMoved,CursorMovedI * lua highlight_trailing_whitespace()]])
vim.cmd([[autocmd BufLeave * lua vim.cmd('match none')]])

-- Auto remove trailing whitespace on save and leaving insert mode
function remove_trailing_whitespace()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[ %s/\s\+$//e ]]) -- remove extra whitespace
    vim.api.nvim_win_set_cursor(0, cursor_pos) -- restore cursor position
end

vim.cmd([[autocmd BufWritePre * lua remove_trailing_whitespace()]])
vim.cmd([[autocmd InsertLeave * lua remove_trailing_whitespace()]])
