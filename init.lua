vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'options'

require 'keymaps'

require 'auto-commands'

local ok, _ = pcall(require, 'colorscheme')
if not ok then
  vim.notify('colorscheme.lua not found — skipping', vim.log.levels.WARN)
  vim.cmd.colorscheme 'default'
end

-- vim: ts=2 sts=2 sw=2 et
