return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup({
            plugins = {
                marks = true, -- shows a list of your marks on ' and `
                registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                spelling = {
                    enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                    suggestions = 20, -- how many suggestions should be shown in the list?
                },
                -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                -- No actual key bindings are created
                presets = {
                    operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                    motions = false, -- adds help for motions
                    text_objects = false, -- help for text objects triggered after entering an operator
                    windows = true, -- default bindings on <c-w>
                    nav = true, -- misc bindings to work with windows
                    z = true, -- bindings for folds, spelling and others prefixed with z
                    g = true, -- bindings for prefixed with g
                },
            },
            -- add operators that will trigger motion and text object completion
            -- to enable all native operators, set the preset / operators plugin above
            -- operators = { gc = "Comments" },
            key_labels = {
                -- override the label used to display some keys. It doesn't effect WK in any other way.
                -- For example:
                -- ["<space>"] = "SPC",
                -- ["<CR>"] = "RET",
                -- ["<tab>"] = "TAB",
            },
            icons = {
                breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
                separator = "➜", -- symbol used between a key and it's label
                group = "+", -- symbol prepended to a group
            },
            popup_mappings = {
                scroll_down = "<C-d>", -- binding to scroll down inside the popup
                scroll_up = "<C-u>", -- binding to scroll up inside the popup
            },
            window = {
                border = "single", -- none, single, double, shadow
                position = "bottom", -- bottom, top
                margin = { 1, 1, 1, 1 }, -- extra window margin [top, right, bottom, left]
                padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
                winblend = 15,
            },
            layout = {
                height = { min = 4, max = 25 }, -- min and max height of the columns
                width = { min = 20, max = 50 }, -- min and max width of the columns
                spacing = 3, -- spacing between columns
                align = "center", -- align columns left, center or right
            },
            ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
            hidden = { "<Silent>", "<Cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
            show_help = true, -- show help message on the command line when the popup is visible
            triggers = "auto", -- automatically setup triggers
            -- triggers = {"<Leader>"} -- or specify a list manually
            triggers_blacklist = {
                -- list of mode / prefixes that should never be hooked by WhichKey
                -- this is mostly relevant for key maps that start with a native binding
                -- most people should not need to change this
                i = { "j", "k" },
                v = { "j", "k" },
            },
        })

        -- Helper functions
        -- Browser in .dotfiles/
        function Get_path()
            if jit.os == "Windows" then
                return "$LOCALAPPDATA/nvim/"
            else
                return "~/.config/nvim/"
            end
        end

        function Nvim_config()
            local path = Get_path()
            require("telescope").extensions.file_browser.file_browser({
                prompt_title = " Neovim Configuration",
                initial_mode = "normal",
                sorting_strategy = "ascending",
                path = path,
                cwd = path,
                grouped = true,
                hidden = true,
                respect_gitignore = true,
                hide_paren_dir = true,
            })
        end

        -- Find files in home directory
        function Get_home()
            if jit.os == "Windows" then
                return "$USERPROFILE/OneDrive/Documents/"
            else
                return "~/"
            end
        end

        function Home()
            local path = Get_home()
            require("telescope.builtin").find_files({
                prompt_title = "  Home Directory",
                cwd = path,
                hidden = false,
                search_dirs = { ".config", ".dotfiles", ".local", "bin", "dev", "Documents" },
            })
        end

        function Explorer()
            require("telescope").extensions.file_browser.file_browser({
                prompt_title = "פּ  Explorer",
                initial_mode = "normal",
                sorting_strategy = "ascending",
                grouped = true,
                hidden = true,
                respect_gitignore = true,
                hide_paren_dir = true,
                mappings = {
                    n = {
                        ["q"] = require("telescope.actions").close,
                    }
                }
            })
        end

        local wk = require("which-key")

        wk.register({
            ["<Leader>"] = {
                ["?"] = { "<Cmd>Telescope oldfiles<CR>", "  Open Recent File" },
                ["c"] = { "<Cmd>bdelete<CR>", "  Close Buffer" },
                ["e"] = { "<Cmd>lua Explorer()<CR>", "פּ  Explorer" },
                ["h"] = { "<Cmd>nohlsearch<CR>", "  No Highlight" },
                ["z"] = { "<Cmd>set spell!<CR>", "暈 Toggle Spellcheck" },
                ["W"] = { "<Cmd>cd %:p:h<CR>:pwd<CR>", "  Set Working Directory" },
                ["C"] = { "<Cmd>lua Nvim_config()<CR>", "  Config Files" },
                ["n"] = { "<Cmd>Telescope neoclip initial_mode=normal<CR>", "  Clipboard" },
                ["i"] = { "`.", "  Back to last insert" },
                ["m"] = { "<Cmd>MindToggleMain<CR>", " Mind" },
                ["p"] = { "<Cmd>BufferLinePick<CR>", "  Pick a buffer" },
            },
        })

        if jit.os ~= "Windows" then
            wk.register({
                ["<Leader>"] = {
                    s = {
                        name = "   Search",

                        b = { "<Cmd>Telescope buffers initial_mode=normal<CR>", "  Buffers" },
                        c = { "<Cmd>Telescope commands<CR>", "  Commands" },
                        f = { "<Cmd>Telescope find_files<CR>", "  Files" },
                        h = { "<Cmd>Telescope help_tags<CR>", "  Help" },
                        H = { "<Cmd>lua Home()<CR>", "  Home Directory" },
                        i = { "<Cmd>Telescope command_history initial_mode=normal<CR>", "  Commands History" },
                        k = { "<Cmd>Telescope keymaps<CR>", "  Keymaps" },
                        l = { "<Cmd>Telescope resume<CR>", "  Resume last search" },
                        M = { "<Cmd>Telescope man_pages<CR>", "  Man Pages" },
                        p = { "<Cmd>Telescope pickers<CR>", "ﭣ  Previous pickers used" },
                        r = { "<Cmd>Telescope registers inital_mode=normal<CR>", "  Registers" },
                        t = { "<Cmd>Telescope live_grep<CR>", "  Text" },
                        w = { "<Cmd>Telescope grep_string<CR>", "Ref. of word under cursor" },
                        ["/"] = { function()
                            require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes')
                            .get_dropdown {
                                winblend = 10,
                                previewer = false,
                            })
                        end, "Fuzzily search in current buffer" },
                    },
                },
            })
        else
            wk.register({
                ["<Leader>"] = {
                    s = {
                        name = "   Search",

                        b = { "<Cmd>Telescope buffers initial_mode=normal<CR>", "  Buffers" },
                        c = { "<Cmd>Telescope commands<CR>", "  Commands" },
                        f = { "<Cmd>Telescope find_files<CR>", "  Files" },
                        h = { "<Cmd>Telescope help_tags<CR>", "  Help" },
                        H = { "<Cmd>lua Home()<CR>", "  Home Directory" },
                        i = { "<Cmd>Telescope command_history initial_mode=normal<CR>", "  Commands History" },
                        k = { "<Cmd>Telescope keymaps<CR>", "  Keymaps" },
                        l = { "<Cmd>Telescope resume<CR>", "  Resume last search" },
                        M = { "<Cmd>Telescope man_pages<CR>", "  Man Pages" },
                        p = { "<Cmd>Telescope pickers", "ﭣ  Previous pickers used<CR>" },
                        r = { "<Cmd>Telescope registers initial_mode=normal<CR>", "  Registers" },
                        t = { "<Cmd>Telescope live_grep<CR>", "  Text" },
                    },
                },
            })
        end

        local map = vim.keymap.set
        local opts = { noremap = true, silent = true }

        -- Barbar
        -- map("n", "<Tab>", ":BufferNext<CR>", opts)
        -- map("n", "<S-Tab>", ":BufferPrevious<CR>", opts)
        -- BufferLine
        map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
        map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

        -- Comment-box
        -- map({ "n", "v" }, "<Leader>bb", "<Cmd>lua require('comment-box').lbox()<CR>")
        -- map({ "n", "v" }, "<Leader>bc", "<Cmd>lua require('comment-box').cbox()<CR>")
        -- map("n", "<Leader>bl", "<Cmd>lua require('comment-box').line(3)<CR>")
        -- map("i", "<M-i>", "<Cmd>lua require('comment-box').line(3)<CR>")
    end
}
