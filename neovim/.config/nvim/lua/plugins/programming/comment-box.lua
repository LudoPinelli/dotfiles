return {
  "LudoPinelli/comment-box.nvim2",
  dev = true,
  config = function()
    require("comment-box").setup({
      comment_style = "line",
    })
  end,
}
