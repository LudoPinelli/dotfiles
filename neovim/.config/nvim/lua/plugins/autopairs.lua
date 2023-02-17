return {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
        require 'nvim-autopairs'.setup({
            check_ts = true,
            ts_config = {
                lua = { "string", "source" },
                javascript = { "string", "template_string" },
                java = false,
            },
            disable_filetype = { "TelescopePrompt", "spectre_panel" },
            fast_wrap = {
                map = "<M-e>",
                chars = { "{", "[", "(", '"', "'" },
                pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
                offset = 0,
                end_key = "$",
                keys = "azertyuiopwxcvbnqsdfghjkl",
                check_comma = true,
                highlight = "PmenuSel",
                highlight_grey = "LineNr",
            },
        })

        require 'cmp'.event:on(
            'confirm_done',
            require 'nvim-autopairs.completion.cmp'.on_confirm_done {}
        )
    end
}
