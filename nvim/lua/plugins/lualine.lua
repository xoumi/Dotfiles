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
      local navic = require("nvim-navic")
      local git_blame = require("gitblame")
      custom_theme.normal.c.bg = "NONE"
      custom_theme.inactive.c.bg = "NONE"

      local project_root = {
        function()
          return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
        end,
        icon = ""
      }
      local MyNvimTree = { sections = { lualine_c = { project_root } }, filetypes = { 'NvimTree' } }

      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = custom_theme,
          -- component_separators = { left = '', right = ''},
          -- section_separators = { left = '', right = ''},
          section_separators = { left = "", right = "" },
          component_separators = { left = " | ", right = " | " },
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
        extensions = { MyNvimTree },
        sections = {
          lualine_a = {
            {
              "mode",
              fmt = function(str)
                return str:sub(1, 1)
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
              path = 1
            }
          },
          lualine_x = {
            "searchcount",
            { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
          },
          lualine_y = {
            { "filetype", colored = false, padding = 2 },
          },
          lualine_z = { "location" }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            { "filename", colored = false, icon_only = true },
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "filetype" },
        },
        -- winbar = {
        --   lualine_c = {
        --     {
        --       function()
        --         return navic.get_location()
        --       end,
        --       cond = function()
        --         return navic.is_available()
        --       end
        --     },
        --   }
        -- },
        inactive_winbar = {},
      })
    end,
  },
}
