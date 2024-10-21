return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      close_if_last_window = true,
      auto_clean_after_session_restore = true,
      enable_git_status = false,
      enable_diagnostics = false,
      enable_cursor_hijack = true,
      use_default_mappings = false,
      hide_root_node = true,
      source_selector = {
        winbar = true,
        content_layout = "center",
        tabs_layout = "equal",
        separator = { left = "", right = "" },
        sources = {
          { source = "filesystem" },
          { source = "buffers" },
        },
      },
      open_files_do_not_replace_types = { "trouble", "qf" },
      default_component_configs = {
        container = {
          enable_character_fade = true,
        },
        indent = {
          indent_size = 2,
          padding = 2, -- extra padding on left hand side
          -- indent guides
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "VertSplit",
          -- expander config, needed for nesting files
          with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        modified = {
          symbol = "+",
          highlight = "NeoTreeModified",
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
        },
      },
      window = {
        auto_expand_width = false,
        mappings = {
          ["l"] = { "open", config = { expand_nested_files = true } },
          ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } },
          ["<esc>"] = "cancel",
          ["L"] = "focus_preview",
          ["s"] = "open_vsplit",
          ["S"] = "vsplit_with_window_picker",
          ["h"] = "close_node",
          ["H"] = "close_all_nodes",
          ["a"] = {
            "add",
            config = {
              show_path = "relative", -- "none", "relative", "absolute"
            },
          },
          ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
          ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
          ["R"] = "refresh",
          ["q"] = "close_window",
          ["?"] = "show_help",
          ["<Tab>"] = "next_source",
          ["i"] = "show_file_details",
        },
      },
      buffers = {
        show_unloaded = true,
        window = {
          mappings = {
            ["d"] = "buffer_delete"
          }
        },
      },
    },
  },
}
