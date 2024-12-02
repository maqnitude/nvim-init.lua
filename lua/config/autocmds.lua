-- Highlight trailing whitespace in red
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    callback = function()
        vim.cmd([[ match ExtraWhitespace /\s\+$/ ]])
        vim.cmd([[ highlight ExtraWhitespace guifg=#ff0000 guibg=#ff0000 ]])
    end
})

-- Remove any highlighting before leaving buffer
vim.api.nvim_create_autocmd({ "BufLeave" }, {
    callback = function()
        vim.cmd([[ match none ]])
    end
})

-- Auto remove trailing whitespace on save and leaving insert mode
vim.api.nvim_create_autocmd({ "BufWritePre", "InsertLeave" }, {
    callback = function()
        local cursor_pos = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[ %s/\s\+$//e ]])                 -- remove extra whitespace
        vim.api.nvim_win_set_cursor(0, cursor_pos) -- restore cursor position
    end
})
