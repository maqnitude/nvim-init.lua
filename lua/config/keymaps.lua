vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local set_keymap = function(mode, lhs, rhs, desc)
    local opts = {
        noremap = true,
        silent = true,
        desc = desc
    }
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- NORMAL --
set_keymap("n", "<leader>fe", vim.cmd.Ex, "[f]ile [e]xplorer")

set_keymap("n", "<leader>sv", vim.cmd.vsplit, "[s]plit [v]ertically")
set_keymap("n", "<leader>sh", vim.cmd.split, "[s]plit [h]orizontally")

set_keymap("n", "<leader><leader>", function()
    vim.cmd("so")
end, "Source")

set_keymap("n", "<C-h>", "<C-w>h")
set_keymap("n", "<C-j>", "<C-w>j")
set_keymap("n", "<C-k>", "<C-w>k")
set_keymap("n", "<C-l>", "<C-w>l")

set_keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- INSERT --
set_keymap("i", "<C-h>", "<Left>")
set_keymap("i", "<C-j>", "<Down>")
set_keymap("i", "<C-k>", "<Up>")
set_keymap("i", "<C-l>", "<Right>")

-- VISUAL --
set_keymap("v", ">", ">gv", "Consecutive tab shift right")
set_keymap("v", "<", "<gv", "Consecutive tab shift left")

set_keymap("v", "<M-j>", ":m '>+1<CR>gv=gv", "Move line(s) down")
set_keymap("v", "<M-k>", ":m '<-2<CR>gv=gv", "Move line(s) up")
