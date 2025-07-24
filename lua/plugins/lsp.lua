return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require('lspconfig')

        lspconfig.clangd.setup {
              cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose', 
                -- '--query-driver=/usr/bin/clang,/usr/bin/clang++,/usr/bin/gcc,/usr/bin/arm-none-eabi-gcc'
            },
        }

        -- lspconfig.asm_lsp.setup { }

        -- lspconfig.sourcekit.setup {
        --     capabilities = {
        --         workspace = {
        --             didChangeWatchedFiles = {
        --                 dynamicRegistration = true,
        --             },
        --         },
        --     },
        -- }

        vim.api.nvim_create_autocmd('LspAttach', {
            desc = "LSP Actions",
            callback = function(args)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, {noremap = true, silent = true, desc = "Hover"})
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, {noremap = true, silent = true, desc = "Definition"})
                vim.keymap.set("n", "gra", vim.lsp.buf.code_action, {noremap = true, silent = true, desc = "Code action"})
            end,
        })
    end,
}
