return {
    "folke/noice.nvim",
    config = function()
        require('noice').setup({
            lsp = {
                override = {
                    ["vim.lsp.util.conver_input_to_mardown_lines"] = true,
                    ["vim.lsp.util.stylize.markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = false,
            },
        })
    end,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    }
}
