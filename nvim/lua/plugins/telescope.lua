return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
    },
    config = function()
      local builtin = require("telescope.builtin")
      local telescope = require("telescope")
      telescope.load_extension("ui-select")

      telescope.setup({
        extensions = {
          ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
        },
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          winblend = 0,
        },
      })

      local set = vim.keymap.set
      set("n", "<leader><leader>", builtin.find_files, {})
      set("n", "<leader>fg", builtin.live_grep, {})
      set("n", "<leader>fc", builtin.commands, {})
      set("n", "<leader>uc", builtin.colorscheme, {})
      set("n", "<leader>fh", builtin.help_tags, {})
    end,
  },
}
