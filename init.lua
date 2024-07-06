-- Leader Key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Nerd Font Check
vim.g.have_nerd_font = true

-- Load options
require 'options'

-- Load keymaps
require 'keymaps'

-- Load autocommands
require 'autocommands'

-- Load plugins
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- local ui = require 'ui'
--
require('lazy').setup({
  require 'theme',
   { import = 'plugins' },
}, {
  ui = ui,
})
--

----   -- require 'kickstart.plugins.debug',
--   -- require 'kickstart.plugins.indent_line',
--   -- require 'kickstart.plugins.lint',
--   -- require 'kickstart.plugins.autopairs',
--   -- require 'kickstart.plugins.neo-tree',
--   -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
