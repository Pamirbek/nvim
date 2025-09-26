return {
    "Civitasv/cmake-tools.nvim",
    -- dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>c7", ":CMakeBuild <CR>" },
        { "<leader>c8", ":CMakeRun <CR>"},
        -- { "<leader>c7", function() require('cmake-tools').build() end },
    },
    opts = {
        -- cmake_executor = {
        --     default_opts = {
        --         terminal = {
        --             split_direction = "vertical", -- "horizontal", "vertical"
        --             split_size = 70,
        --         },
        --     },
        -- },
        cmake_runner = {
            default_opts = {
                terminal = {
                    split_direction = "vertical", -- "horizontal", "vertical"
                    split_size = 70,
                },
            },
        },
    },
}
