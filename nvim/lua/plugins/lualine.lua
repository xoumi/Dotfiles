return {
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup({})
    end,
  },
  { 'AndreM222/copilot-lualine' },
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
          local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
          return branch;
        end,
        icon = ""
      }
      local MyNvimTree = {
        sections = { lualine_c = { project_root } },
        filetypes = { 'NvimTree' }
      }

      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = custom_theme,
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          -- section_separators = { left = "", right = "" },
          -- component_separators = { left = " | ", right = " | " },
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
                return str:sub(1, 3)
              end,
            },
          },
          lualine_b = {
            "diagnostics",
          },
          lualine_c = {
            {
              "filename",
              path = 4,
              symbols = {
                modified = ' +',
                readonly = ' RO'
              }
            }
          },
          lualine_x = {
            { "copilot", show_colors = false,show_loading = true },
            "searchcount",
            { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
          },
          lualine_y = {
            {},
          },
          lualine_z = {}
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
