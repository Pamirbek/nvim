return {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
        "nvim-neotest/nvim-nio", -- required for nvim-dap-ui
        "rcarriga/nvim-dap-ui",
    },
    keys = {
        { "<leader>b", function() require('dap').toggle_breakpoint() end },
        { "<leader>%", function() require('dap').continue() end },
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

        dap.adapters.codelldb = {
            type = "executable",
            command = "/home/pamcho/Library/codelldb-linux-x64/extension/adapter/codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"

            -- On windows you may have to uncomment this:
            -- detached = false,
        }

        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "codelldb",
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
