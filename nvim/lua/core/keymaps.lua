local set = vim.keymap.set
local opts = function(desc)
  return { noremap = true, silent = true, desc = desc, nowait = true }
end

set("n", "j", "gj")
set("n", "k", "gk")
set("n", "<C-s>", "<Cmd>w<cr>", opts("select all"))
set("n", "U", "<C-r>", opts("redo"))
set("n", "<Esc>", "<cmd>nohlsearch<cr>", opts("redo"))
set("n", "<leader>i", "<C-a>", opts("Increment number"))
set("n", "<leader>d", "<C-x>", opts("Decrement number"))

-- jumplist
set("n", "<leader>h", "<C-o>", opts("Jump backward"))
set("n", "<leader>l", "<C-i>", opts("Jump forward"))

-- windows
set("n", "sv", "<Cmd>vsplit<CR>", opts("split vertical"))
set("n", "sh", "<Cmd>split<CR>", opts("split horizontal"))
set("n", "<C-w>", require("core.functions").close_window, opts("close window / buffer"))

-- motions
set("n", "H", "^", opts("start of line"))
set("n", "L", "$", opts("end of line"))


-- Clipboard
set({"n", "v"}, "<leader>y", '"+y', opts("copy to system clipboard"))
set("n", "<leader>yy", '"+yy', opts("copy to system clipboard"))
set("n", "<leader>Y", '"+yg_', opts("copy to system clipboard"))
set({"n", "v"}, "<leader>p", '"+p', opts("paste from system clipboard"))
set({"n", "v"}, "<leader>P", '"+P', opts("paste from system clipboard"))


-- UFO Folds
set("n", "zA", require("ufo").openAllFolds, opts("Open all folds"))
set("n", "zM", require("ufo").closeAllFolds, opts("close all folds"))


-- LSP Functionalities
set("n", "<leader>n", "<cmd>Navbuddy<cr>", opts("Lazy"))
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function()
    -- vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, opts("Goto Definition"))
    -- vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts("Show hover"))
    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = "format" })
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts("Rename"))
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code actions"))
  end,
})

-- UI
set("n", "<leader>um", "<cmd>Mason<cr>", opts("Mason"))
set("n", "<leader>ul", "<cmd>Lazy<cr>", opts("Lazy"))

-- Treesj
set("n", "<leader>m", require('treesj').toggle, opts("Toggle Split"))

-- LSP Popups
local preview = require('goto-preview')
set("n", "<leader>d", preview.goto_preview_definition, opts("Definition Popup"))
-- nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
-- nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
-- nnoremap gpD <cmd>lua require('goto-preview').goto_preview_declaration()<CR>
-- nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
-- nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>
