return {
    { 'nvim-telescope/telescope.nvim',            branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make',   cond = vim.fn.executable 'make' == 1 },
    "nvim-telescope/telescope-file-browser.nvim",
    cmd = "Telescope",
    config = function()
        local actions = require("telescope.actions")
        local trouble = require("trouble.providers.telescope")
        require('telescope').setup {
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                path_display = { "smart" },
                dynamic_preview_title = true,
                winblend = 0,
                sorting_strategy = "ascending",
                layout_strategy = "vertical",
                layout_config = {
                    prompt_position = "bottom",
                    height = 0.95,
                },
                -- layout_config = {
                -- 	prompt_position = "top",
                -- 	horizontal = {
                -- 		width_padding = 0.04,
                -- 		height_padding = 0.1,
                -- 		preview_width = 0.6,
                -- 	},
                -- 	vertical = {
                -- 		width_padding = 0.05,
                -- 		height_padding = 1,
                -- 		preview_height = 0.5,
                -- 	},
                -- },

                mappings = {
                    i = {
                        ["<Esc>"] = actions.close,

                        ["<C-n>"] = actions.cycle_history_next,
                        ["<C-p>"] = actions.cycle_history_prev,

                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,

                        ["<C-c>"] = actions.close,

                        ["<Down>"] = actions.move_selection_next,
                        ["<Up>"] = actions.move_selection_previous,

                        ["<CR>"] = actions.select_default,
                        ["<C-x>"] = actions.select_horizontal,
                        ["<C-v>"] = actions.select_vertical,

                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,

                        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                        ["<C-q>"] = trouble.open_with_trouble,
                        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        ["<C-l>"] = actions.complete_tag,
                        ["<C-_>"] = actions.which_key,
                    },

                    n = {
                        ["<Esc>"] = actions.close,
                        ["<CR>"] = actions.select_default,
                        ["<C-x>"] = actions.select_horizontal,
                        ["<C-v>"] = actions.select_vertical,

                        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                        ["<C-q>"] = trouble.open_with_trouble,
                        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                        ["j"] = actions.move_selection_next,
                        ["k"] = actions.move_selection_previous,
                        ["H"] = actions.move_to_top,
                        ["M"] = actions.move_to_middle,
                        ["L"] = actions.move_to_bottom,

                        ["<Down"] = actions.move_selection_next,
                        ["<Up>"] = actions.move_selection_previous,
                        ["gg"] = actions.move_to_top,
                        ["G"] = actions.move_to_bottom,

                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,

                        ["?"] = actions.which_key,
                    },
                },
            },

            pickers = {
                -- Default config for builtin pickers:
                find_files = {
                    hidden = true,
                },
            },
            extensions = {
                -- Extension conf
            },
            pcall(require('telescope').load_extension, 'fzf'),
            pcall(require('telescope').load_extension, 'file_browser'),

            vim.keymap.set('n', '<leader>/', function()
                require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = '[/] Fuzzily search in current buffer]' }),
        }
    end
}
