return {
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    config = true,
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        git = { enable = false },
        diagnostics = { enable = false },
        hijack_cursor = true,
        update_focused_file = {
          enable = true,
        },
        renderer = {
          icons = { show = { folder = false } },
          root_folder_label = false,
        },
        view = {
          signcolumn = "no",
          float = {
            enable = true,
            quit_on_focus_loss = true,
            open_win_config = function()
              local screen_w = vim.opt.columns:get()
              local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
              local window_w = math.floor(screen_w * 0.3)
              local window_h = math.floor(screen_h * 0.8)
              local center_x = (screen_w / 2) - (window_w / 2) - 2
              local center_y = ((vim.opt.lines:get() - window_h) / 2)
              return {
                border = "rounded",
                relative = "editor",
                row = center_y,
                col = center_x - window_w / 2,
                width = window_w,
                height = window_h,
              }
            end,
          },
        },
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          local set = vim.keymap.set
          local function opts(desc)
            return { desc = desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end

          local preview = require("nvim-tree-preview")

          api.config.mappings.default_on_attach(bufnr)
          set("n", "?", api.tree.toggle_help, opts("Help"))
          set("n", "L", api.node.open.vertical, opts("Vsplit"))
          set("n", "l", api.node.open.edit, opts("Open"))
          set("n", "h", api.node.navigate.parent_close, opts("Collapse"))
          set("n", "H", api.tree.collapse_all, opts("Collapse All"))
          set("n", "P", preview.watch, opts("Preview (Watch)"))
          set("n", "<Esc>", api.tree.close, opts("Close"))
        end,
      })

      vim.keymap.set("n", "<leader>b", "<Cmd>NvimTreeOpen<CR>", { noremap = true, silent = true, nowait = true })
    end,
  },
  {
    "b0o/nvim-tree-preview.lua",
    lazy = true,
    opts = {
      keymaps = {
        ["<Esc>"] = { action = "close", unwatch = true },
        ["<Tab>"] = { action = "toggle_focus" },
        ["<CR>"] = { open = "edit" },
        ["<C-t>"] = { open = "tab" },
        ["<C-v>"] = { open = "vertical" },
        ["<C-x>"] = { open = "horizontal" },
      },
      min_width = 85,
      min_height = 50,
      max_width = 85,
      max_height = 50,
      wrap = false,
      border = "rounded",
      zindex = 100,
      show_title = false,      -- Whether to show the file name as the title of the preview window
    },
  },
}
