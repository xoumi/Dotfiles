return {
  close_window = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local winid = vim.api.nvim_get_current_win()
    local wins = vim.fn.win_findbuf(bufnr)

    if #wins == 1 then
      -- This is the only window showing this buffer
      vim.api.nvim_buf_delete(bufnr, { force = true })
    else
      -- There are other windows showing this buffer
      vim.api.nvim_win_close(winid, false)
    end
  end,
}
