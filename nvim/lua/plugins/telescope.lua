return {
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    config = function()
      require("telescope").load_extension("smart_open")
    end,
    dependencies = { "kkharji/sqlite.lua" },
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
    opts = function()
      local builtin = require("telescope.builtin")
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local open_with_trouble = require("trouble.sources.telescope").open

      telescope.setup({
        pickers = {
          buffers = {
            initial_mode = "normal",
          },
          grep_string = {
            initial_mode = "normal",
          }
        },

        extensions = {
          smart_open = {
            match_algorithm = "fzf",
          },
          fzf = {
            case_mode = "ignore_case",
          },
        },
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          winblend = 0,
          prompt_prefix = "   ",
          selection_caret = " ",
           mappings = {
            i = { ["<c-t>"] = open_with_trouble },
            n = {
              ["t"] = open_with_trouble,
              ["q"] = actions.close
            },
          },
        },
      })
      telescope.load_extension("fzf")

      local set = vim.keymap.set
      local extensions = telescope.extensions

      set("n", "<leader><leader>", function()
        extensions.smart_open.smart_open()
      end, {})
      set("n", "<leader>fg", builtin.live_grep, {})
      set("n", "<leader>fG", builtin.grep_string, {})
    end,
  },
}
