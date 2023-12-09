return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        pcall(require("nvim-treesitter.install").update { with_sync = true })
    end,
    -- dependencies = {
    --     'nvim-treesitter/nvim-treesitter-textobjects',
    -- },
    config = function()
        require("nvim-treesitter.configs").setup {
            -- Add languages to be installed here that you want installed for treesitter
            ensure_installed = { "bash", "c", "cpp", "fish", "haskell", "kdl", "lua", "markdown", "python", "query", "ron", "rust", "toml", "vim", "vimdoc" },

            highlight = { enable = true },
            indent = { enable = true, disable = { 'python' } },
            -- incremental_selection = {
            --     enable = true,
            --     keymaps = {
            --         init_selection = '<c-space>',
            --         node_incremental = '<c-space>',
            --         scope_incremental = '<c-s>',
            --         node_decremental = '<c-backspace>',
            --     },
            -- },
            -- textobjects = {
            --     select = {
            --         enable = true,
            --         lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            --         keymaps = {
            --             -- You can use the capture groups defined in textobjects.scm
            --             ['aa'] = '@parameter.outer',
            --             ['ia'] = '@parameter.inner',
            --             ['af'] = '@function.outer',
            --             ['if'] = '@function.inner',
            --             ['ac'] = '@class.outer',
            --             ['ic'] = '@class.inner',
            --         },
            --     },
            --     move = {
            --         enable = true,
            --         set_jumps = true, -- whether to set jumps in the jumplist
            --         goto_next_start = {
            --             [']m'] = '@function.outer',
            --             [']]'] = '@class.outer',
            --         },
            --         goto_next_end = {
            --             [']M'] = '@function.outer',
            --             [']['] = '@class.outer',
            --         },
            --         goto_previous_start = {
            --             ['[m'] = '@function.outer',
            --             ['[['] = '@class.outer',
            --         },
            --         goto_previous_end = {
            --             ['[M'] = '@function.outer',
            --             ['[]'] = '@class.outer',
            --         },
            --     },
            --     swap = {
            --         enable = true,
            --         swap_next = {
            --             ['<leader>a'] = '@parameter.inner',
            --         },
            --         swap_previous = {
            --             ['<leader>A'] = '@parameter.inner',
            --         },
            --     },
            -- },
        }

        -- Diagnostic keymaps
        -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        -- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
        -- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
    end
}
