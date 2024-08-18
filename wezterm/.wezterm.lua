-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.window_decorations = "NONE"
config.window_background_opacity = 0.8
-- For example, changing the color scheme:
config.color_scheme = 'Flatland'

-- and finally, return the configuration to wezterm
return config
