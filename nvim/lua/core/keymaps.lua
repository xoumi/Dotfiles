local set = vim.keymap.set
local opts = function(desc)
  return { noremap = true, silent = true, desc = desc, nowait = true }
end

set("n", ";", ":", opts(""))
set("n", "<C-a>", "gg<S-v>G", opts("select all"))
set("n", "<C-s>", "<Cmd>w<cr>", opts("select all"))
set("n", "U", "<C-r>", opts("redo"))
set("n", "<Esc>", "<cmd>nohlsearch<cr>", opts("redo"))
set("n", "<leader>h", "<cmd>BufferLineCyclePrev<cr>", opts("Previous buffer"))
set("n", "<leader>l", "<cmd>BufferLineCycleNext<cr>", opts("Next buffer"))

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


-- UI
set("n", "<leader>um", "<cmd>Mason<cr>", { desc = "Mason" })
set("n", "<leader>ul", "<cmd>Lazy<cr>", opts("Lazy"))
set("n", "<leader>n", "<cmd>Navbuddy<cr>", opts("Lazy"))


-- LSP Functionalities
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function()
    vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, opts("Goto Definition"))
    vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts("Show hover"))
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts("Rename"))
    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = "format" })
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code actions"))
  end,
})
