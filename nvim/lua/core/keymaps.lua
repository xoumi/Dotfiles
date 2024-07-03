-- TODO: Load on veryLazy

local set = vim.keymap.set
local opts = function(desc)
  return { noremap = true, silent = true, desc = desc, nowait = true }
end

set("n", ";", ":", opts(""))
set("n", "<C-a>", "gg<S-v>G", opts("select all"))
set("n", "<C-s>", "<Cmd>w<cr>", opts("select all"))
set("n", "U", "<C-r>", opts("redo"))
set("n", "<Esc>", "<cmd>nohlsearch<cr>", opts("redo"))
set("n", "<leader>ul", "<cmd>Lazy<cr>", opts("Lazy"))
set("n", "<leader>h", "<cmd>BufferLineCyclePrev<cr>", opts("Previous buffer"))
set("n", "<leader>l", "<cmd>BufferLineCycleNext<cr>", opts("Next buffer"))
set("n", "<leader>n", "<cmd>Navbuddy<cr>", opts("Lazy"))

-- windows
set("n", "sv", "<Cmd>vsplit<CR>", opts("split vertical"))
set("n", "ss", "<Cmd>split<CR>", opts("split horizontal"))
set("n", "<C-w>", "<cmd>bd<cr>", opts("close buffer"))

-- motions
set("n", "H", "^", opts("start of line"))
set("n", "L", "$", opts("end of line"))

-- clipboard
-- copy
set("v", "<leader>y", "\"+y", opts("copy to clipboard"))
set("n", "<leader>Y", "\"+yg_", opts("copy to clipboard"))
set("n", "<leader>y", "\"+y", opts("copy to clipboard"))
set("n", "<leader>yy", "\"+yy", opts("copy to clipboard"))

-- paste
set("n", "<leader>p", "\"+p", opts("paste from clipboard"))
set("n", "<leader>P", "\"+P", opts("paste from clipboard"))
set("v", "<leader>p", "\"+p", opts("paste from clipboard"))
set("v", "<leader>P", "\"+P", opts("paste from clipboard"))
