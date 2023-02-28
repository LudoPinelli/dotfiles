return {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = function()
        require 'toggleterm'.setup({
            -- size can be a number or function which is passed the current terminal
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<c-t>]],
            hide_numbers = true, -- hide the number column in toggleterm buffers
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = "1", -- the degree by which to darken to terminal colour
            start_in_insert = true,
            insert_mappings = true, -- whether or not the open mapping applies in insert mode
            persist_size = true,
            direction = "horizontal", -- 'vertical' | 'horizontal' | 'window' | 'float',
            close_on_exit = true, -- close the terminal window when the process exits
            shell = vim.o.shell, -- change the default shell
            -- This field is only relevant if direction is set to 'float'
            float_opts = {
                -- The border key is *almost* the same as 'nvim_win_open'
                -- see :h nvim_win_open for details on borders however
                -- the 'curved' border is a custom border type
                -- not natively supported but implemented in this plugin.
                border = "single", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
                -- width = <value>,
                -- height = <value>,
                winblend = 3,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
        })

        local Terminal = require("toggleterm.terminal").Terminal

        -- lazygit
        local lazygit = Terminal:new({
            cmd = "lazygit",
            dir = "git_dir",
            direction = "float",
            float_opts = {
                border = "curved",
            },
            close_on_exit = true,
            on_open = function()
                vim.cmd("startinsert!")
            end,
        })
        function Lazygit_toggle()
            lazygit:toggle()
        end

        -- Open python shell (bpython)
        local python = Terminal:new({
            cmd = "bpython",
            dir = vim.fn.expand("%:p"),
            direction = "horizontal",
            close_on_exit = true,
            on_open = function()
                vim.cmd("startinsert!")
            end,
        })
        function Python_toggle()
            python:toggle()
        end

        -- Open Node shell
        local node = Terminal:new({
            cmd = "node",
            dir = vim.fn.expand("%:p"),
            direction = "horizontal",
            close_on_exit = true,
            on_open = function()
                vim.cmd("startinsert!")
            end,
        })
        function Node_toggle()
            node:toggle()
        end

        -- Open btop
        local btop = Terminal:new({
            cmd = "btop",
            dir = "~/",
            direction = "float",
            float_opts = {
                border = "curved",
            },
            close_on_exit = true,
            on_open = function()
                vim.cmd("startinsert!")
            end,
        })
        function Btop_toggle()
            btop:toggle()
        end

        -- Launch cargo watch
        local cargo_watch = Terminal:new({
            cmd = "cargo watch -q -c -x 'run -q'",
            dir = "git_dir",
            direction = "horizontal",
            close_on_exit = true,
            on_open = function()
                vim.cmd(":wincmd k")
            end,
        })
        function Cargo_watch_toggle()
            cargo_watch:toggle()
        end

        local wk = require("which-key")

        wk.register({
            ["<Leader>"] = {
                t = {
                    name = "   Terminal",

                    f = { "<Cmd>ToggleTerm direction=float<CR>", "  Float" },
                    g = { "<Cmd>lua Lazygit_toggle()<CR>", "  Lazygit" },
                    h = { "<Cmd>ToggleTerm size=10 direction=horizontal<CR>", "  Horizontal" },
                    n = { "<Cmd>lua Node_toggle()<CR>", "  Node.js" },
                    p = { "<Cmd>lua Python_toggle()<CR>", "   Python" },
                    t = { "<Cmd>lua Btop_toggle()<CR>", "   btop" },
                    v = { "<Cmd>ToggleTerm size=50 direction=vertical<CR>", "   Vertical" },
                    w = { "<Cmd>lua Cargo_watch_toggle()<CR>", "   Cargo Watch" },
                },
            }
        })
    end
}
