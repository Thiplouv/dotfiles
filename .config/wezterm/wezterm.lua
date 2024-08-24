local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

config.term = "xterm-256color"
config.audible_bell = "Disabled"
config.default_prog = { "/opt/homebrew/bin/bash" }

-- Window
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.80
config.color_scheme = "Github-Dark-HC"

-- Cursor
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 1000
config.animation_fps = 144

-- Font
config.font = wezterm.font("Liga SFMono Nerd Font")
config.font_size = 18

-- Rendering settings
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
config.max_fps = 144

-- Command Palette
config.command_palette_rows = 6
config.command_palette_font_size = 18.0
config.command_palette_bg_color = "#0a0c10"
config.command_palette_fg_color = "#f0f3f6"

-- Multiplexer
config.unix_domains = {
	{
		name = "unix",
	},
}

config.default_gui_startup_args = { "connect", "unix" }

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

-- Single key shortcuts
config.keys = {
	-- Spawn a new tab
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = act.SpawnCommandInNewTab({ cwd = wezterm.home_dir }),
	},

	-- Activate resize mode
	{
		key = "r",
		mods = "CTRL|SHIFT",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},

	-- Activate Spawn new pane mode
	{
		key = "Return",
		mods = "CTRL|SHIFT",
		action = act.ActivateKeyTable({
			name = "spawn_pane",
			one_shot = true,
		}),
	},

	-- Reload Configuration
	{
		key = "F5",
		mods = "CMD|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
	-- Focus pane
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Down"),
	},

	-- Close current pane
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
}

-- Multiple keys shortcuts
config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },

		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },

		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },

		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },

		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
	},

	spawn_pane = {
		{ key = "h", action = act.SplitPane({ direction = "Left" }) },

		{ key = "l", action = act.SplitPane({ direction = "Right" }) },

		{ key = "k", action = act.SplitPane({ direction = "Up" }) },

		{ key = "j", action = act.SplitPane({ direction = "Down" }) },

		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
	},
}

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, pane)
	local name = window:active_key_table()
	window:set_right_status(name or "")
end)

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
