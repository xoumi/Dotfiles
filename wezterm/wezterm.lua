local wezterm = require("wezterm")
local config = {}

config.font_rules = {
  {
    intensity = "Bold",
    italic = false,
    font = wezterm.font {
      family = "JetBrainsMono NF",
      weight = "Bold"
    },
  },
}
config.font = wezterm.font("JetBrainsMono NF")

config.font_size = 13
config.window_decorations = "RESIZE"
config.line_height = 1.2
config.enable_tab_bar = false
config.default_cursor_style = 'SteadyUnderline'
config.underline_thickness = 3
config.window_padding = {
  left = 10,
  top = 24,
  right = 10,
  bottom = 10,
}

config.colors = {
  foreground = '#e1e1e1',    -- The default text color
  background = '#020a02',   -- The default background color

  cursor_bg = '#b3d194',  -- BG under cursor
  cursor_fg = 'black',    -- FG under cursor

  ansi = {
    '#232323', -- black
    '#ff8080', -- red
    '#b0e8b0', -- green
    '#ffe699', -- yellow
    '#b3d194', -- c1 / blue
    '#fabd9e', -- c2 / purple
    '#ebdbad', -- c3 / cyan
    'silver',  -- white
  },
  brights = {
    '#454545', -- black
    '#ff4d4d', -- red
    '#a6f2a6', -- green
    '#ffcc33', -- yellow
    '#e6f5d6', -- c1l / blue
    '#ff9966', -- c2l / purple
    '#ebdbad', -- c3l / cyan
    'white',
  },
}

config.window_background_opacity = 0.85
config.macos_window_background_blur = 100
return config
