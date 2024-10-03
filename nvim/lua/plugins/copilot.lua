return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    enabled = false,
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    opts = {
      debug = false, -- Enable debugging
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    enabled = false,
    config = function()
      require("copilot").setup({
      })
    end,
  }
}
