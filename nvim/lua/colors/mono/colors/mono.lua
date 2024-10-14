vim.opt.background = 'dark'
vim.g.colors_name = 'mono'
package.loaded['mono'] = nil
require('lush')(require('mono'))
