return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = function()
    local neogit = require "neogit"
    neogit.setup {}
    local set = vim.keymap.set
    local function opts(desc)
      return { desc = desc, noremap = true, silent = true, nowait = true }
    end
    set("n", "<leader>lg", neogit.open, opts("Neogit"))
  end,
}
