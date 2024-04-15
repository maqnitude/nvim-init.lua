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
vim.opt.scrolloff = 8

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

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
--

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase =true
vim.opt.smartcase = true

