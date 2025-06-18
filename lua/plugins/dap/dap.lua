return {
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        config = function()
            local dap = require("dap")
            -- local gdb_path = "D:/msys64/ucrt64/bin/gdb.exe"

            -- Adapters setup
            dap.adapters.cppdbg = {
                id = "cppdbg",
                type = "executable",
                command = "D:\\tools\\cpptools-windows-x64\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe",
                options = {
                    detached = false
                }
            }

            -- Languages config
            dap.configurations.cpp = {
                {
                    name = "Launch",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        local path = vim.fn.input({
                            prompt = "Path to executable: ",
                            default = vim.fn.getcwd() .. "/",
                            completion = "file"
                        })

                        return (path and path ~= "") and path or dap.ABORT
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtEntry = false,
                    setupCommands = {
                        {
                            text = "-enable-pretty-printing",
                            description = "Enable prettyin printing",
                            ignoreFailures = false
                        }
                    }
                },
            }
            dap.configurations.c = dap.configurations.cpp

            -- Key maps
            local set_keymap = require("utils").set_keymap
            local widgets = require("dap.ui.widgets")

            set_keymap("n", "<F5>", function() dap.continue() end)
            set_keymap("n", "<F10>", function() dap.step_over() end)
            set_keymap("n", "<F11>", function() dap.step_into() end)
            set_keymap("n", "<F12>", function() dap.step_out() end)

            set_keymap("n", "<leader>Db", function() dap.toggle_breakpoint() end)
            set_keymap("n", "<leader>DB", function() dap.set_breakpoint() end)
            set_keymap("n", "<leader>Dr", function() dap.repl.open() end)
            set_keymap("n", "<leader>Dl", function() dap.run_last() end)

            set_keymap({ "n", "v" }, "<leader>Dh", function() widgets.hover() end)
            set_keymap({ "n", "v" }, "<leader>Dp", function() widgets.preview() end)
            set_keymap("n", "<leader>Df", function() widgets.centered_float(widgets.frames) end)
            set_keymap("n", "<leader>Ds", function() widgets.centered_float(widgets.scopes) end)
        end
    },
}
