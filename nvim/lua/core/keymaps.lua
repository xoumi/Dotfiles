-- TODO: Load on veryLazy

local set = vim.keymap.set
local opts = function(desc)
  return { noremap = true, silent = true, desc = desc, nowait = true }
end

set("n", ";", ":", opts(""))
set("n", "<C-a>", "gg<S-v>G", opts("select all"))
set("n", "U", "<C-r>", opts("redo"))
set("n", "<leader>ul", "<cmd>Lazy<cr>", opts("Lazy"))

-- windows
set("n", "sv", "<Cmd>vsplit<CR>", opts("split vertical"))
set("n", "ss", "<Cmd>split<CR>", opts("split horizontal"))
set("n", "<C-w>", "<cmd>q<cr>", opts("close window"))

-- motions
set("n", "H", "^", opts("start of line"))
set("n", "L", "$", opts("end of line"))
