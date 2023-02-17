return {
    'nvim-lualine/lualine.nvim', -- Fancier statusline
    config = function()
        local hide_in_width = function()
            return vim.fn.winwidth(0) > 80
        end

        local diagnostics = {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn" },
            symbols = { error = " ", warn = " " },
            colored = false,
            update_in_insert = false,
            always_visible = false,
        }

        local filename = {
            "filename",
            path = 0,
            shorting_target = 40,
        }

        local diff = {
            "diff",
            colored = true,
            symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
            cond = hide_in_width,
        }

        local filetype = {
            "filetype",
            icons_enabled = true,
            icon = nil,
        }

        local branch = {
            "branch",
            icons_enabled = true,
            icon = "",
        }

        local mode = {
            "mode",
            separator = { left = "" },
            right_padding = 2,
        }

        local location = {
            "location",
            separator = { right = "" },
            left_padding = 0,
        }

        require('lualine').setup({
            options = {
                icons_enabled = true,
                theme = "catppuccin",
                component_separators = "│",
                section_separators = { left = "", right = "" },
                disabled_filetypes = { "Neotree", "Outline" },
            },
            sections = {
                lualine_a = { mode },
                lualine_b = { "getcwd", branch },
                lualine_c = { filename },
                lualine_x = { diff, diagnostics },
                lualine_y = { filetype },
                lualine_z = { "progress", location },
            },
            inactive_sections = {
                lualine_a = { filename },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { location },
            },
            tabline = {},
            extensions = {},
        })
    end
}
