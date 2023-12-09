return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependecies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },

    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local on_attach = function(_, bufnr)
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end

                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

            nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
            nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
            nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
            nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
            nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

            -- See `:help K` for why this keymap
            nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
            nmap('<A-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

            -- Lesser used LSP functionality
            nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
            nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
            nmap('<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, '[W]orkspace [L]ist Folders')

            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                vim.lsp.buf.format()
            end, { desc = 'Format current buffer with LSP' })
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()
        local servers = { "rust_analyzer", "hls", "pyright" }

        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
        end
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "lua" },
            settings = {
                lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    completion = {
                        callSnippet = "Replace",
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                    hint = {
                        enable = true,
                    },
                },
            },
        })

        local wk = require("which-key")

        wk.register({
            ["<Leader>"] = {
                l = {
                    name = "   LSP",
                    a = { "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
                    d = { "<Cmd>lua vim.diagnostic.open_float()<CR>", "Diagnostics in float window" },
                    D = { "<Cmd>Telescope diagnostics<CR>", "Diagnostics in Telescope" },
                    f = { "<Cmd>lua vim.lsp.buf.formatting()<CR>", "  Format" },
                    i = { "<Cmd>LspInfo<CR>", "  Info" },
                    l = { "<Cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
                    r = { "<Cmd>lua vim.lsp.buf.rename()<CR>", "凜  Rename" },
                    s = { "<Cmd>Telescope lsp_dynamic_workspace_symbols initial_mode=normal<CR>", "  Workspace Symbols" },
                    S = { "<Cmd>AerialToggle!<CR>", "  Aerial" },
                    t = { "<Cmd>lua vim.lsp.buf.type_definition()<CR>", "Type Definition" },
                },
            }
        })
    end,
}
