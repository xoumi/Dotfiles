return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        style = {
          -- TODO: Fix color fetching
          "#444444"
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
        style = {"#aaaaaa"}
      },
      indent = { enable = false },
      blank = { enable = false },
    })
  end,
}
