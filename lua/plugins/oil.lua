return {
--     "stevearc/oil.nvim",
--     ---@module 'oil'
--     ---@type oil.SetupOpts
--     dependencies = { "nvim-tree/nvim-web-devicons" },
--     config = function()
--         require("oil").setup {
--             columns = { "icon" },
--             keymaps = {
--                 ["<C-h>"] = false,
--                 ["<C-l>"] = false,
--                 ["<C-k>"] = false,
--                 ["<C-j>"] = false,
--             },
--         }
--
--         -- Open parent directory in current window
--         vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
--     end,
}
