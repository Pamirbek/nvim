return {
    "neovim/nvim-lspconfig",
    config = function()

        vim.lsp.config( "clangd", {
            keys = {
                { "<leader>o", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
            },
            cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose', '--fallback-style=LLVM'-- '-style=file:../pamcho/.clang-format'
                -- '--query-driver=/usr/bin/clang,/usr/bin/clang++,/usr/bin/gcc,/usr/bin/arm-none-eabi-gcc'
            },
        })
        vim.lsp.enable({"clangd"})

        vim.lsp.enable({"ts_ls"})

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
        --

        vim.diagnostic.config {
            virtual_text = true
        }

        vim.api.nvim_create_autocmd('LspAttach', {
            desc = "LSP Actions",
            callback = function(args)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, {noremap = true, desc = "Hover"})
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, {noremap = true, desc = "Definition"})
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {noremap = true, desc = "Declaration"})
                vim.keymap.set("n", "gca", vim.lsp.buf.code_action, {noremap = true, desc = "Code action"})
                vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {noremap = true, desc = "Format"})
            end,
        })
    end,
}
