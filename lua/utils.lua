local M = {}

local default_opts = {
    noremap = true,
    silent = true,
}

function M.set_keymap(mode, lhs, rhs, opts)
    local options = vim.tbl_extend("force", default_opts, opts or {})
    vim.keymap.set(mode, lhs, rhs, options)
end

return M
