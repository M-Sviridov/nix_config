local wezterm = require("wezterm")
local act = wezterm.action

if wezterm.config_builder then
	config = wezterm.config_builder()
else
	config = {}
end

config.font_size = 12

config.font = wezterm.font({
	family = "Maple Mono NF",
	harfbuzz_features = { "calt", "cv01", "ss05", "ss08" },
	weight = "Regular",
})

config.enable_tab_bar = false
config.use_fancy_tab_bar = false

config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = { WheelUp = 1 } } },
		mods = "NONE",
		action = act.ScrollByLine(-3),
	},
	{
		event = { Down = { streak = 1, button = { WheelDown = 1 } } },
		mods = "NONE",
		action = act.ScrollByLine(3),
	},
}

config.window_decorations = "NONE"
config.window_close_confirmation = "NeverPrompt"

config.color_scheme = "Catppuccin Mocha"

config.max_fps = 144

return config
