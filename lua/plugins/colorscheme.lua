return {
    "ntk148v/habamax.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
        vim.cmd.colorscheme("habamax")
    end,
}
-- Using Lazy
-- return {
--   "navarasu/onedark.nvim",
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require('onedark').setup {
--       style = 'darker'
--     }
--     require('onedark').load()
--   end
-- }
