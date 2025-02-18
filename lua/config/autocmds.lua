local ignored_buf = { "CMakeLists.txt" }
local ignored_ft = { "help", "markdown" }

local function is_ignored(buf)
    local fname = vim.api.nvim_buf_get_name(buf)
    local tail = vim.fn.fnamemodify(fname, ":t")

    if vim.tbl_contains(ignored_buf, tail) then
        return true
    end

    if vim.tbl_contains(ignored_ft, vim.bo.filetype) then
        return true
    end

    return false
end

local editor_augroup = vim.api.nvim_create_augroup("EditorAugroup", {
    clear = false
})

-- Highlight trailing whitespace in red
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    group = editor_augroup,
    pattern = { "*" },
    callback = function(event)
        if is_ignored(event.buf) then
            return
        end

        vim.cmd([[ match ExtraWhitespace /\s\+$/ ]])
        vim.cmd([[ highlight ExtraWhitespace guifg=#ff0000 guibg=#ff0000 ]])
    end
})

-- Remove any highlighting before leaving buffer
vim.api.nvim_create_autocmd({ "BufLeave" }, {
    group = editor_augroup,
    pattern = { "*" },
    callback = function()
        vim.cmd([[ match none ]])
    end
})

-- Auto remove trailing whitespace on save and leaving insert mode
vim.api.nvim_create_autocmd({ "BufWritePre", "InsertLeave" }, {
    group = editor_augroup,
    pattern = { "*" },
    callback = function(event)
        if is_ignored(event.buf) then
            return
        end

        local cursor_pos = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[ %s/\s\+$//e ]])                 -- remove extra whitespace
        vim.api.nvim_win_set_cursor(0, cursor_pos) -- restore cursor position
    end
})
