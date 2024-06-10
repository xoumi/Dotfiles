return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup {
      options = {
        modified_icon = '+',
        sort_by = "extension",
        separator_style = {" ▕" , " ▕"},
        -- separator_style = {" a " , " b "},
        enforce_regular_tabs = false,
        offsets = {
          {
            filetype = "NvimTree",
            text = function()
              return " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
            end,
            text_align = "left",
            separator = true
          }
        },
      }
    }
  end
}
