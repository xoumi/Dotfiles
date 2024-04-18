local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

vim.filetype.add {
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
}

autocmd('BufWritePost', {
  pattern = "kitty.conf",
  command = "!kill -SIGUSR1 $(pgrep kitty)"
});

