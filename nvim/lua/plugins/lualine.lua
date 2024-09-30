return {
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup({})
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local custom_theme = require("lualine.themes.mellow")
      local git_blame = require("gitblame")
      custom_theme.normal.c.bg = "NONE"
      custom_theme.inactive.c.bg = "NONE"

      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = custom_theme,
          component_separators = { left = "│", right = "│" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = {
            {
              "mode",
              fmt = function(str)
                return str:sub(1, 3)
              end,
            },
          },
          lualine_b = {
            { "branch", icon = "" },
            "diagnostics",
          },
          lualine_c = {
            {
              "filename",
              path = 4,
              symbols = {
                modified = " +",
                readonly = " RO",
              },
            },
          },
          lualine_x = {
            "searchcount",
            { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
          },
          lualine_y = {
            {
              require("noice").api.status.search.get,
              cond = require("noice").api.status.search.has,
              icon = " ",
            },
          },
          lualine_z = {
            {
              require("noice").api.status.mode.get,
              cond = require("noice").api.status.mode.has,
            },
          },
        },
      })
    end,
  },
}
