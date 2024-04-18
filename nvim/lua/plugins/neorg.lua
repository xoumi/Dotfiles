return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "nvim-neorg/neorg",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "luarocks.nvim",
    },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.export"] = {
            config = {
              export_dir = "export"
            }
          }, -- Adds pretty icons to your documents
          ["core.keybinds"] = {
            config = {
              neorg_leader = "<leader>n",
            },
          },
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/str/doc/notes",
              },
              default_workspace = "notes",
            },
          },
        },
      })
    end,
  },
}
