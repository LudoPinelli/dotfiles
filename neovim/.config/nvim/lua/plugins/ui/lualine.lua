return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn", "info", "hint" },
      symbols = { error = " ", warn = " ", info = " ", hint = " " },
      colored = false,
      update_in_insert = false,
      always_visible = false,
    }

    local filename = {
      "filename",
      newfile_status = true,
      path = 1,
      shorting_target = 40,
      symbols = {
        modified = "  ",
        readonly = "  ",
        unnamed = "  ",
        newfile = "  ",
      },
    }

    local diff = {
      "diff",
      colored = true,
      symbols = { added = " ", modified = " ", removed = " " },
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

    local noice_mode = {
      require("noice").api.status.mode.get,
      cond = require("noice").api.status.mode.has,
      color = { fg = "#ff9e64" },
    }

    require("lualine").setup({
      options = {
        icons_enabled = true,
        component_separators = "│",
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "Outline" },
        theme = "auto",
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { branch },
        lualine_c = { filename, diagnostics, noice_mode },
        lualine_x = { diff },
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
  end,
}
