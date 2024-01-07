return {
  "LudoPinelli/comment-box.nvim",
  dev = true,
  config = function()
    require("comment-box").setup({
      comment_style = "line",
    })
  end,
}
