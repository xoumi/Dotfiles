local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

vim.filetype.add {
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
}

autocmd('BufWritePost', {
  pattern = "kitty.conf",
  command = "!kill -SIGUSR1 $(pgrep kitty)"
});

autocmd("BufWinEnter", {
    group = vim.api.nvim_create_augroup("help_window_right", {}),
    pattern = { "*.txt" },
    callback = function()
        if vim.o.filetype == 'help' then
          vim.cmd.wincmd("L")
        end
    end
})

