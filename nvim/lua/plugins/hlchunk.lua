return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local cb = function()
      local fn = vim.fn

      local function get_color(group, attr)
        return fn.synIDattr(fn.synIDtrans(fn.hlID("Winseparator")), "fg#")
      end
      return get_color()
    end

    require("hlchunk").setup({
      chunk = {
        enable = true,
        style = {
          { fg = cb() },
        },
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = "─",
        },
        error_sign = false,
      },
      line_num = {
        enable = false,
        use_treesitter = true,
        style = { "#aaaaaa" },
      },
      indent = { enable = false },
      blank = { enable = false },
    })
  end,
}
