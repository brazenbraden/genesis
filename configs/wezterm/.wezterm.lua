-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.default_prog= { 'wsl.exe', '~', '--distribution', 'Ubuntu' }

config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.85
config.color_scheme = 'darkmatrix'
config.font_size = 14.0
config.font = wezterm.font_with_fallback {
  "JetBrains Mono",
  "Fira Code",
  "Hack",
}

-- and finally, return the configuration to wezterm
return config
