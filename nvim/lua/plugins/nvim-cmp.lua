return {
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "dcampos/nvim-snippy",
  "dcampos/cmp-snippy",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
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

      cmp.setup({
        snippet = {
          expand = function(args)
            require("snippy").expand_snippet(args.body)
          end,
        },

        window = {
          completion = cmp.config.window.bordered({
            side_padding = 2,
            scrollbar = false,
          }),
          documentation = cmp.config.window.bordered({
            side_padding = 2,
          }),
        },

        formatting = {
          format = function (_, vim_item)
            -- Add padding
            vim_item.kind = vim_item.kind .. "  "
            return vim_item
          end
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
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            elseif snippy.can_expand_or_advance() then
              snippy.expand_or_advance()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif snippy.can_jump(-1) then
              snippy.previous()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        sources = cmp.config.sources(
          { { name = "nvim_lsp" } },
          { { name = "buffer" } },
          { { name = "nvim_lsp_signature_help" } }
        ),
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
          { { name = "path" } },
          { { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } } }
        ),
      })

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = "buffer" } }),
      })

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
