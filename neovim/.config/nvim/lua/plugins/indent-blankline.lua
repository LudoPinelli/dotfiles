return {
    'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        indentLine_enabled = 1,
        char = "▏",
        filetype_exclude = {
            "log",
            "gitcommit",
            "markdown",
            "json",
            "txt",
            "help",
            "neo-tree",
            "git",
            "TelescopePrompt",
            "", -- for all buffers without a file type
        },
        buftype_exclude = { "terminal", "nofile" },
        show_trailing_blankline_indent = false,
        show_first_indent_level = true,
        show_current_context = true,
        char_list = { "|", "¦", "┆", "┊" },
        space_char = " ",
        context_patterns = {
            "class",
            "function",
            "method",
            "block",
            "list_literal",
            "selector",
            "^if",
            "^table",
            "if_statement",
            "while",
            "for",
        },
    },
}
