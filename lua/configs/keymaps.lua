vim.g.mapleader = " "

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

set_keymap("n", "<C-h>", "<C-w>h")
set_keymap("n", "<C-j>", "<C-w>j")
set_keymap("n", "<C-k>", "<C-w>k")
set_keymap("n", "<C-l>", "<C-w>l")

set_keymap("n", "<leader><leader>", function()
    vim.cmd("so")
end, "Source")

-- Swtich between tab size 2 and 4
set_keymap("n", "<leader><Tab>2", function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2

    print("tabstop/softtabstop/shiftwidth set to 2")
end, "Change tab size to 2")

set_keymap("n", "<leader><Tab>4", function()
  vim.opt.tabstop = 4
  vim.opt.softtabstop = 4
  vim.opt.shiftwidth = 4

  print("tabstop/softtabstop/shiftwidth set to 4")
end, "Change tab size to 4")

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
