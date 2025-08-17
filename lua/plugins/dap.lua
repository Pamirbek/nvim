return {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
        "nvim-neotest/nvim-nio", -- required for nvim-dap-ui
        "rcarriga/nvim-dap-ui",
    },
    keys = {
        { "<leader>b", function() require('dap').toggle_breakpoint() end },
        { "<F6>", function() require('dap').continue() end },
        { "<F7>", function() require('dap').step_over() end },
        { "<F10>", function() require('dap').terminate() end },
        { "<F12>", function() require('dapui').toggle() end },
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")

        dapui.setup()
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
        }

        dap.configurations.cpp = {
            {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            },
        }

        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp
    end
}
