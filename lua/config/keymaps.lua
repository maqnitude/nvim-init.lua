vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local set_keymap = require("utils").set_keymap

-- NORMAL --
set_keymap("n", "<leader>fe", vim.cmd.Ex, { desc = "[f]ile [e]xplorer" })

set_keymap("n", "<leader>sv", vim.cmd.vsplit, { desc = "[s]plit [v]ertically" })
set_keymap("n", "<leader>sh", vim.cmd.split, { desc = "[s]plit [h]orizontally" })

set_keymap("n", "<leader><leader>", function()
    vim.cmd("so")
end, { desc = "Source" })

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
set_keymap("v", ">", ">gv", { desc = "Consecutive tab shift right" })
set_keymap("v", "<", "<gv", { desc = "Consecutive tab shift left" })

set_keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move line(s) down" })
set_keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move line(s) up" })

if vim.g.vscode then
    local vscode = require("vscode")

    set_keymap("n", "<leader>F", function()
        vscode.action("editor.action.formatDocument")
    end)

    set_keymap("n", "<leader>fe", function()
        vscode.call("workbench.view.explorer")
    end)
    set_keymap("n", "<leader>ff", function()
        vscode.call("workbench.action.quickOpen")
    end)
end
