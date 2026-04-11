vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'options'

require 'keymaps'

require 'auto-commands'

require 'plugins'

local ok, _ = pcall(require, 'colorscheme')
if not ok then
  vim.cmd.colorscheme 'tokyonight-moon'
end

-- vim: ts=2 sts=2 sw=2 et
