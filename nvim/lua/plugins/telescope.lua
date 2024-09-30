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
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
    },
    config = function()
      local builtin = require("telescope.builtin")
      local telescope = require("telescope")
      local fb_actions = require("telescope._extensions.file_browser.actions")

      telescope.setup({

        extensions = {
          smart_open = {
            match_algorithm = "fzf",
          },
          fzf = {
            case_mode = "respect_case"
          },
          file_browser = {
            hijack_netrw = true,
            initial_mode = "normal",
            display_stat = { date = true, size = true, mode = false },
            git_status = false,
            mappings = {
              ["n"] = {
                ["h"] = fb_actions.goto_parent_dir,
                ["l"] = "select_default"
              },
            },
          },
        },
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          winblend = 0,
        },
      })
      telescope.load_extension("fzf")
      telescope.load_extension("file_browser")

      local set = vim.keymap.set
      local extensions = telescope.extensions

      set("n", "<leader><leader>", function()
        extensions.smart_open.smart_open()
      end, {})
      set("n", "<leader>g", builtin.live_grep, {})
      set("n", "<leader>b", ":Telescope file_browser<CR>", {})
      set("n", "<leader>fc", builtin.commands, {})
      set("n", "<leader>fh", builtin.help_tags, {})
    end,
  },
}
