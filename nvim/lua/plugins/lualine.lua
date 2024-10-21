return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local git_blame = require("gitblame")

      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "mono",
          component_separators = { left = "│", right = "│" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
          always_divide_middle = true,
        },
        sections = {
          lualine_a = {
            {
              "mode",
              fmt = function(str)
                return str:sub(1, 3)
              end,
              separator = { right = "", left = "" },
            },
          },
          lualine_b = {
            -- { "branch", icon = "" },
            {
              "filename",
              path = 4,
              symbols = {
                modified = "+",
                readonly = "RO",
              },
            },
          },
          lualine_c = {
            "diagnostics",
          },
          lualine_x = {
            { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
          },
          lualine_y = {
            {
              require("noice").api.status.mode.get,
              cond = require("noice").api.status.mode.has,
            },
          },
          lualine_z = {},
        },
      })
    end,
  },
}
