return {
    'folke/trouble.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    config = function()
        require('trouble').setup {}

        local wk = require("which-key")
        wk.register({
            ["<Leader>"] = {
                x = {
                    name = "   Lists",

                    d = { "<Cmd>TroubleToggle document_diagnostics<CR>", "Document Diagnostics" },
                    l = { "<Cmd>TroubleToggle loclist<CR>", "Loclist" },
                    q = { "<Cmd>TroubleToggle quickfix<CR>", "Quickfix List" },
                    r = { "<Cmd>TroubleToggle lsp_references<CR>", "Ref. of word under cursor" },
                    w = { "<Cmd>TroubleToggle workspace_diagnostics<CR>", "Workspace Diagnostics" },
                    x = { "<Cmd>TroubleToggle<CR>", "Trouble" },
                },
            }
        })

        local trouble = require('trouble.providers.telescope')

        local telescope = require('telescope')

        telescope.setup {
            defaults = {
                mappings = {
                    i = { ['<C-t>'] = trouble.open_with_trouble },
                    n = { ['<C-t>'] = trouble.open_with_trouble },
                }
            }
        }
    end
}
