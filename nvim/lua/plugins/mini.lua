return {
  { 'echasnovski/mini.basics', version = false, opts = {
    options = { extra_ui = true },
    mappings = {
      basic = true,
      option_toggle_prefix = '<leader>t',
      windows = false
    }
  } },
  { "echasnovski/mini.indentscope", version = false, config = true },
  { "echasnovski/mini.pairs", version = false, config = true },
  { "echasnovski/mini.splitjoin", version = false, config = true },
  { "echasnovski/mini.surround", version = false, config = true },
  { 'echasnovski/mini.comment', version = false, config = true },
  {
    "j-hui/fidget.nvim",
    opts = {
      progress = {
        display = {
          done_ttl = 1,
        },
      },
      notification = {
        override_vim_notify = true,
        window = {
          winblend = 0,
          border = 'rounded'
        }
      }
    },
  },
}
