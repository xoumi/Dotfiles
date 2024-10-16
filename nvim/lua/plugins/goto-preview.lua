return {
  "rmagatti/goto-preview",
  event = "BufEnter",
  config = function()
    require("goto-preview").setup({
      width = 119, -- Width of the floating window
      height = 20, -- Height of the floating window
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- Border characters of the floating window
      default_mappings = false, -- Bind default mappings
      post_open_hook = function(bufnr)
        vim.keymap.set("n", "q", "<C-w>q", {buffer = bufnr, noremap = true})
        vim.keymap.set("n", "L", "<C-w>L", {buffer = bufnr, noremap = true})
      end,
    })
  end,
}
