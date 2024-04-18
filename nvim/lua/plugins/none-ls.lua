return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null = require("null-ls")

    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = "format" })

    null.setup({
      sources = {
        null.builtins.formatting.stylua,
        null.builtins.formatting.prettierd,
        null.builtins.formatting.gofmt,
        null.builtins.formatting.goimports_reviser,
      },
    })
  end,
}
