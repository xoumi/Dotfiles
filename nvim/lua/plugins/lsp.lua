return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {},
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "denols",
        "tailwindcss",
        "eslint",
        "volar",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          { "SmiteshP/nvim-navic", opts = { lsp = { auto_attach = true } } },
          "MunifTanjim/nui.nvim",
        },
        opts = {
          lsp = { auto_attach = true },
          window = {
            border = "rounded",
            sections = { right = { preview = "always" } },
          },
        },
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local language_servers = {
        "terraformls",
        "tailwindcss",
        "eslint",
        "vuels",
        "denols",
        "gopls",
        "golangci_lint_ls",
        "lua_ls",
      }

      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      local root_dir = {
        tailwindcss = function(fname)
          local root_pattern = require("lspconfig").util.root_pattern(
            "tailwind.config.cjs",
            "tailwind.config.js",
            "tailwind.config.ts"
          )
          return root_pattern(fname)
        end,
        denols = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
      }

      local ls_settings = {
        gopls = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
        lua_ls = {
          Lua = {
            diagnostics = {
              disable = { "missing-parameters", "missing-fields" },
            },
          },
        },
      }

      for _, ls in ipairs(language_servers) do
        lspconfig[ls].setup({
          capabilities = capabilities,
          settings = ls_settings[ls],
          root_dir = root_dir[ls]
        })
      end

      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = "rounded"
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end

      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = "rounded",
            source = "always",
            prefix = " ",
            scope = "cursor",
          }
          vim.diagnostic.open_float(nil, opts)
        end,
      })
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      local nvim_lsp = require('lspconfig')
      require("typescript-tools").setup {
        root_dir = nvim_lsp.util.root_pattern("package.json"),
        single_file_support = false,
        settings = {
          tsserver_file_preferences = {
            importModuleSpecifierPreference = "non-relative"
          }
        }
      }
    end
  },

}
