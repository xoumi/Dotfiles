return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  config = function()
    require("ufo").setup({
      close_fold_kinds_for_ft = {
        default = { "imports", "comment" },
      },
      open_fold_hl_timeout = 400,
      preview = {},
      enable_get_fold_virt_text = true,
      fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate, ctx)
        local newVirtText = {}

        local filler = " ⋯ "
        local suffix = (" %d lines "):format(endLnum - lnum)
        local fillerWidth = vim.fn.strdisplaywidth(filler)
        local suffixWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - fillerWidth - suffixWidth

        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, { chunkText, chunk[2] })
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. ("-"):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end

        table.insert(newVirtText, { filler, "Folded" })

        if curWidth < targetWidth then
          local endVirtText = ctx.get_fold_virt_text(endLnum)
          for i, chunk in ipairs(endVirtText) do
            local chunkText = chunk[1]
            local hlGroup = chunk[2]
            if i == 1 then
              chunkText = chunkText:gsub("^%s+", "")
            end
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if targetWidth > curWidth + chunkWidth then
              table.insert(newVirtText, { chunkText, hlGroup })
            end
            curWidth = curWidth + chunkWidth
          end
        end

        if curWidth < targetWidth then
          suffix = suffix .. ("-"):rep(targetWidth - curWidth)
        end


        table.insert(newVirtText, { suffix, "Folded" })
        return newVirtText
      end,
    })
  end,
}
