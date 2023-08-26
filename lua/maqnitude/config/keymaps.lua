vim.g.mapleader = " "

local opts = {
    noremap = true,
    silent = true
}

-- NORMAL --
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, opts) -- [f]ile [e]xplorer

vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end, opts)

-- INSERT --
vim.keymap.set("i", "<C-h>", "<Left>", opts)
vim.keymap.set("i", "<C-j>", "<Down>", opts)
vim.keymap.set("i", "<C-k>", "<Up>", opts)
vim.keymap.set("i", "<C-l>", "<Right>", opts)

-- VISUAL --
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "<", "<gv", opts)
