local o = vim.opt
local g = vim.g

-- Indentation
o.expandtab = true
o.shiftwidth = 2
o.softtabstop = -1
o.smarttab = true
o.autoindent = true
o.guicursor = "n-v-c:hor50,i:ver20"
vim.wo.foldnestmax = 1

-- Generic
o.termguicolors = true
o.ignorecase = true
o.signcolumn = "yes"
o.scrolloff = 15
o.cmdheight = 0
o.pumblend = 0
o.updatetime = 150
o.relativenumber = false
o.number = true
o.cursorline = false
o.winblend = 0
o.conceallevel = 2
o.concealcursor = "c"
o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
o.showmode = false
o.hidden = false

-- Disable for nvim-tree
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Folds for ufo
o.foldcolumn = "0"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
o.fillchars = {
  fold = '-',
  eob = ' ',
  diff = "╱"
}

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
