return {
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "dcampos/nvim-snippy",
  "dcampos/cmp-snippy",
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local snippy = require("snippy")

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end


      function Merge(t1, t2)
        for k, v in pairs(t2) do
          if (type(v) == "table") and (type(t1[k] or false) == "table") then
            Merge(t1[k], t2[k])
          else
            t1[k] = v
          end
        end
        return t1
      end

      cmp.setup({
        snippet = {
          expand = function(args)
            require("snippy").expand_snippet(args.body)
          end,
        },

        window = {
          completion = Merge(
            cmp.config.window.bordered(),
            {
              side_padding = 1,
              scrollbar = false,
            }
          ),
          documentation = cmp.config.window.bordered(),
        },


        enabled = function()
          -- Disable in comments section
          local context = require("cmp.config.context")
          return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
        end,

        mapping = cmp.mapping.preset.insert({
          ["<C-c>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(
            function(fallback)
              if cmp.visible() then
                cmp.confirm({ select = true })
              elseif snippy.can_expand_or_advance() then
                snippy.expand_or_advance()
              elseif has_words_before() then
                cmp.complete()
              else
                fallback()
              end
            end, { "i", "s" }
          ),
          ["<S-Tab>"] = cmp.mapping(
            function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif snippy.can_jump(-1) then
                snippy.previous()
              else
                fallback()
              end
            end, { "i", "s" }
          ),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
        }, { { name = "buffer" } }),
      })

      -- cmp.setup.cmdline(":", {
      --   mapping = cmp.mapping.preset.cmdline(),
      --   sources = cmp.config.sources({
      --     { name = "path" },
      --   }, {
      --     {
      --       name = "cmdline",
      --       option = {
      --         ignore_cmds = { "Man", "!" },
      --       },
      --     },
      --   }),
      -- })
    end,
  },
}
