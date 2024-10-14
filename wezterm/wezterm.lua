local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font 'JetBrainsMono NerdFont'
config.font_size = 10
config.line_height = 1.36
config.freetype_load_target = "Light"
config.freetype_render_target = "HorizontalLcd"
config.enable_tab_bar = false
config.default_cursor_style = 'SteadyUnderline'
config.underline_thickness = 3
config.window_padding = {
  left = 20,
  top = 20,
  right = 20,
  bottom = 20
};

config.color_scheme_dirs = {'/home/soma/.config/wezterm/colors'}
-- config.color_scheme = 'pywal'

config.window_background_opacity = 0.7;
return config
