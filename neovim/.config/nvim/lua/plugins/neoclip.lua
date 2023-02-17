return {
    "AckslD/nvim-neoclip.lua",
    requires = {
        { "nvim-telescope/telescope.nvim" },
    },
    config = function()
        require 'neoclip'.setup({
            keys = {
                telescope = {
                    i = {
                        select = "<cr>",
                        paste = "<c-p>",
                        paste_behind = "<c-a>",
                        replay = "<c-q>",
                        delete = "<c-d>",
                        custom = {},
                    },
                },
            },
        })

        require("telescope").load_extension("neoclip")
    end,
}
