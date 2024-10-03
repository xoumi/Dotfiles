local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font('Jetbrains Mono', { weight = 'Medium' })
config.font_size = 13
config.window_decorations = "RESIZE"
config.line_height = 1.2
config.enable_tab_bar = false
config.window_padding = {
  left = 30,
  top = 40,
  right = 30,
  bottom = 40
};

-- config.color_scheme_dirs = {'/Users/livspace/.config/wezterm/colors'}
-- config.color_scheme = 'pywal'
config.color_scheme = 'Everblush'

config.window_background_opacity = 1;
return config
