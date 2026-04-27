vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local buf = args.buf
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition', buffer = buf })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration', buffer = buf })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Show references', buffer = buf })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover info', buffer = buf })
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action', buffer = buf })
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol', buffer = buf })
        vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format document', buffer = buf })
    end,
})

-- Sync terminal's background with Neovim's background
vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
  callback = function()
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    if not normal.bg then
      return
    end
    io.write(string.format("\027]11;#%06x\027\\", normal.bg))
  end,
})

-- Reset the terminal's background to its original color when you quit Neovim
vim.api.nvim_create_autocmd("UILeave", {
  callback = function()
    io.write("\027]111\027\\")
  end,
})

-- vim: ts=2 sts=2 sw=2 et
