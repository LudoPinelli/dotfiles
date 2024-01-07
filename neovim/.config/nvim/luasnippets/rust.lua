local ls = require("luasnip")

local s, t, i = ls.s, ls.text_node, ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}

-- ──────────────────────────────────────────────────────────────────────

local prd = s(
  "prd",
  fmt([[eprintln!("[Debug]: {} => {{:?}}", {});]], {
    i(1, "name"),
    rep(1),
  })
)
table.insert(snippets, prd)

-- ──────────────────────────────────────────────────────────────────────

return snippets, autosnippets
