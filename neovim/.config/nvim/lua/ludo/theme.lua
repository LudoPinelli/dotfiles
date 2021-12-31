local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
	return
end

nightfox.setup({
	fox = "nordfox",
	styles = {
		comments = "italic",
		-- functions = "italic",
	},
	inverse = {
		match_paren = true,
	},
})

nightfox.load("nordfox")
