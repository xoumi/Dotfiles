return {
  {
    dir = "~/.config/nvim/lua/colors/mono",
    lazy = true,
  },
  {
    "rktjmp/lush.nvim",
    config = function()
      vim.cmd.colorscheme("mono")
    end,
  },
}
