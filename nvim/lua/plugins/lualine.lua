return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
  local custom_theme = require'lualine.themes.mellow'
    custom_theme.normal.c.bg = 'NONE'
    custom_theme.inactive.c.bg = 'NONE'

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = custom_theme,
        component_separators = {},
        section_separators = {},
        disabled_filetypes = {
          statusline = {'NvimTree'},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {{ 'mode', fmt = function(str) return str:sub(1,1) end }},
        lualine_b = {
          {'branch', icon = ''},
          'diff', 'diagnostics'
        },
        lualine_c = {'filename', 'searchcount'},
        lualine_x = {'location'},
        lualine_y = {
          { 'filetype', colored = false, icon_only = true, padding = 2 }
        },
        lualine_z = {}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          { 'filename', colored = false, icon_only = true }
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'filetype'}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
    }
  end
}
