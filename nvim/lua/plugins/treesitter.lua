return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter.configs")
      treesitter.setup({
        ensure_installed = {"vimdoc", "lua", "javascript", "html", "typescript", "json", "yaml", "vue", "hyprlang", "norg", "go", "tsx" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        modules = {},
        ignore_install = {},
        auto_install = false
      })
    end
  },
  {'Fymyte/rasi.vim', ft = 'rasi'}
}
