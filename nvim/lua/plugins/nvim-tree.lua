return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
  },
  opts = {
  },
  config = function()
    require("nvim-tree").setup({
      update_focused_file = {
        enable = true,
      };

      renderer = {
        icons = {
          git_placement = 'signcolumn',
          padding = '  '
        },
        root_folder_label = false,
        highlight_opened_files = "all"
      };

      on_attach = function(bufnr)
        local api = require "nvim-tree.api"
        local set = vim.keymap.set

        local function opts(desc)
          return { desc = desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)

        set('n', '?', api.tree.toggle_help, opts('Help'))
        set("n", "L", api.node.open.vertical, opts("Vsplit"))
        set("n", "l", api.node.open.edit, opts("Open"))
        set("n", "h", api.node.navigate.parent_close, opts("Collapse"))
        set("n", "H", api.tree.collapse_all, opts("Collapse All"))

      end
    })
    vim.keymap.set('n', "<C-b>", "<Cmd>NvimTreeOpen<CR>", { noremap = true, silent = true, nowait = true })
    vim.keymap.set('n', "<C-e>", "<Cmd>NvimTreeToggle<CR>", { noremap = true, silent = true, nowait = true })

    -- Kill nvim-tree if it's the last open window
    vim.api.nvim_create_autocmd("QuitPre", {
      callback = function()
        local invalid_win = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
          local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
          if bufname:match("NvimTree_") ~= nil then
            table.insert(invalid_win, w)
          end
        end
        if #invalid_win == #wins - 1 then
          -- Should quit, so we close all invalid windows.
          for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
        end
      end
    })
  end
}
