return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("noice").setup({
      presets = {
        lsp_doc_border = true,
      },
      messages = {
        enabled = true, -- enables the Noice messages UI
        view_error = "mini", -- view for errors
        view_warn = "mini", -- view for warnings
        view_history = "messages", -- view for :messages
        view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
      },
      lsp = {
        signature = {
          enabled = false,
        },
        message = {
          enabled = true,
        },
        documentation = {
          enabled = false,
        },
      },
      health = {
        checker = false,
      },
      routes = {
        {
          filter = { event = "msg_show", blocking = true },
          opts = { skip = true }
        },
      },

      views = {
        mini = {
          timeout = 4000,
          win_options = {
            winblend = 0,
          },
          position = {
            row = 0,
            col = "100%",
          },
        },
      },
    })
  end,
}
