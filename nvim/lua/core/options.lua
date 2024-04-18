local o = vim.opt
local g = vim.g

-- Indentation
o.expandtab = true
o.shiftwidth = 2
o.softtabstop = -1
o.smarttab = true
o.autoindent = true
vim.wo.foldnestmax = 1

-- Generic
o.termguicolors = true
o.signcolumn = 'yes'
o.scrolloff = 15
o.cmdheight = 0
o.pumblend = 0
o.updatetime = 150
o.relativenumber = true
o.number = true
o.cursorline = false
o.winblend = 0
o.conceallevel = 2
o.concealcursor = 'c'

-- Disable for nvim-tree
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Folds for ufo
o.foldcolumn = '0'
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
