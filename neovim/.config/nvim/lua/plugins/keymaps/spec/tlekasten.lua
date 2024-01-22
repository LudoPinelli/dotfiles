-- Mapping helper
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- On hesitation, bring up the command panel
map("n", "<leader>z", ":lua require('telekasten').panel()<CR>")

-- Function mappings
map("n", "<leader>zf", ":lua require('telekasten').find_notes()<CR>")
map("n", "<leader>zd", ":lua require('telekasten').find_daily_notes()<CR>")
map("n", "<leader>zg", ":lua require('telekasten').search_notes()<CR>")
map("n", "<leader>zz", ":lua require('telekasten').follow_link()<CR>")
map("n", "<leader>zT", ":lua require('telekasten').goto_today()<CR>")
map("n", "<leader>zW", ":lua require('telekasten').goto_thisweek()<CR>")
map("n", "<leader>zw", ":lua require('telekasten').find_weekly_notes()<CR>")
map("n", "<leader>zn", ":lua require('telekasten').new_note()<CR>")
map("n", "<leader>zN", ":lua require('telekasten').new_templated_note()<CR>")
map("n", "<leader>zy", ":lua require('telekasten').yank_notelink()<CR>")
map("n", "<leader>zc", ":lua require('telekasten').show_calendar()<CR>")
map("n", "<leader>zC", ":CalendarT<CR>")
map("n", "<leader>zi", ":lua require('telekasten').paste_img_and_link()<CR>")
map("n", "<leader>zt", ":lua require('telekasten').toggle_todo()<CR>")
map("n", "<leader>zb", ":lua require('telekasten').show_backlinks()<CR>")
map("n", "<leader>zF", ":lua require('telekasten').find_friends()<CR>")
map(
  "n",
  "<leader>zI",
  ":lua require('telekasten').insert_img_link({ i=true })<CR>"
)
map("n", "<leader>zp", ":lua require('telekasten').preview_img()<CR>")
map("n", "<leader>zm", ":lua require('telekasten').browse_media()<CR>")
map("n", "<leader>za", ":lua require('telekasten').show_tags()<CR>")
map("n", "<leader>#", ":lua require('telekasten').show_tags()<CR>")
map("n", "<leader>zr", ":lua require('telekasten').rename_note()<CR>")

-- we could define [[ in **insert mode** to call insert link
-- inoremap [[ <cmd>:lua require('telekasten').insert_link()<CR>
-- alternatively: leader [
map(
  "i",
  "<leader>[",
  "<cmd>:lua require('telekasten').insert_link({ i=true })<CR>"
)
map(
  "i",
  "<leader>zt",
  "<cmd>:lua require('telekasten').toggle_todo({ i=true })<CR>"
)
map(
  "i",
  "<leader>#",
  "<cmd>:lua require('telekasten').show_tags({i = true})<CR>"
)
