return {
    "folke/noice.nvim",
    config = function()
        require('noice').setup({
            cmdline_popup = {
                views = {
                    position = {
                        row = "auto",
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = "auto",
                    },
                },
            },
            popupmenu = {
                relative = "editor",
                position = {
                    row = 8,
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = 10,
                },
                border = {
                    style = "rounded",
                    padding = { 0, 1 },
                },
                win_options = {
                    winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                },
            },
            lsp = {
                override = {
                    ["vim.lsp.util.conver_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize.markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true,
                -- command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = true,
            },
        })
    end,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    }
}
