return {
  {
    "mellow-theme/mellow.nvim",
    priority=1000,
    config = function()
      local c = require("mellow.colors").dark
      local hl = vim.api.nvim_set_hl

      vim.g.mellow_transparent = true
      vim.cmd.colorscheme "mellow"

      -- Floating window
      hl(0, "NormalFloat",           { fg = 'NONE', bg = 'NONE', blend = 0 })
      hl(0, "FloatBorder",           { fg = 'NONE', bg = 'NONE', blend = 0 })

      -- Telescope
      hl(0, "TelescopeBorder",       { fg = c.fg, bg = 'NONE' })
      hl(0, "TelescopeNormal",       { fg = c.fg, bg = 'NONE' })
      hl(0, "TelescopeResultsTitle", { fg = c.bg, bg = c.red })
      hl(0, "TelescopePromptBorder", { fg = c.fg, bg = 'NONE' })
      hl(0, "TelescopePromptNormal", { fg = c.fg, bg = 'NONE' })

      -- Animated indent line
      hl(0, "MiniIndentscopeSymbol", { fg = c.gray05, bg = 'NONE' })
    end
  },
}
