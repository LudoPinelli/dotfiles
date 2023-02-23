return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            transparent_background = false,
            styles = {
                comments = {},
            },
        })
        vim.cmd [[colorscheme catppuccin-macchiato]]
    end
}
