local status_ok, notify = pcall(require, "notify")
if not status_ok then
	return
end

notify.setup({
	-- Animation style (fade_in_slide_out | fade | slide | static)
	stages = "fade",

	-- Default timeout for notifications
	timeout = 5000,

	-- For stages that change opacity this is treated as the highlight behind the window
	-- Set this to either a highlight group or an RGB hex value e.g. "#000000"
	background_colour = "Normal",

	-- Minimum width for notification windows
	minimum_width = 50,
})
