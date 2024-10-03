return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter.configs")
      treesitter.setup({
        ensure_installed = {
          "vimdoc",
          "lua",
          "javascript",
          "html",
          "typescript",
          "json",
          "yaml",
          "vue",
          "hyprlang",
          "norg",
          "go",
          "tsx",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        modules = {},
        ignore_install = {},
        auto_install = false,
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner"
            },
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  { "Fymyte/rasi.vim", ft = "rasi" },
}
