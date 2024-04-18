return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
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
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
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

      local telescope_last = 0
      function telescope_resume()
        if telescope_last == 0 then
          telescope_last = 1
          builtin.live_grep()
        else
          builtin.resume()
        end
      end


      local set = vim.keymap.set
      set("n", "<leader><leader>", function()
        require("telescope").extensions.smart_open.smart_open()
      end, {})
      set("n", "<leader>fg", telescope_resume, {})
      set("n", "<leader>fb", builtin.buffers, {})
      set("n", "<leader>fc", builtin.commands, {})
      set("n", "<leader>uc", builtin.colorscheme, {})
      set("n", "<leader>fh", builtin.help_tags, {})
    end,
  },
}
