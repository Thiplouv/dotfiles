local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

config.window_background_opacity = 0.80
config.color_scheme = "Github-Dark-HC"

config.font = wezterm.font("Liga SFMono Nerd Font")
config.font_size = 16

config.term = "xterm-256color"
config.audible_bell = "Disabled"

-- Rendering settings
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
config.max_fps = 144

-- Command Palette
config.command_palette_rows = 6
config.command_palette_font_size = 16.0
config.command_palette_bg_color = "#0a0c10"
config.command_palette_fg_color = "#f0f3f6"

-- Tab Bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.colors = {
	tab_bar = {
		background = "#0a0c10",

		active_tab = {
			-- The color of the background area for the tab
			bg_color = "#0a0c10",
			-- The color of the text for the tab
			fg_color = "#f0f3f6",

			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},

		inactive_tab = {
			bg_color = "#0a0c10",
			fg_color = "#808080",
		},

		inactive_tab_hover = {
			bg_color = "#0a0c10",
			fg_color = "#808080",
			italic = false,
		},

		new_tab = {
			bg_color = "#0a0c10",
			fg_color = "#f0f3f6",
		},

		new_tab_hover = {
			bg_color = "#0a0c10",
			fg_color = "#f0f3f6",
			italic = false,
		},
	},
}

-- New tab working dir is $HOME
config.keys = {
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = act.SpawnCommandInNewTab({ cwd = wezterm.home_dir }),
	},
}

-- Adds option to rename tab in the command palette (Kitty way)
wezterm.on("augment-command-palette", function(window, pane)
	return {
		{
			brief = "Rename tab",
			icon = "md_rename_box",

			action = act.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
	}
end)

return config
