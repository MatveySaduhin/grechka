-- [[ Basic Keymaps ]]

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- netrw
vim.keymap.set('n', '\\', function()
    if vim.bo.filetype == 'netrw' then
        vim.cmd('b #')
    else
        vim.cmd('Explore')
    end
end, { desc = 'Toggle netrw' })

-- mini.files
vim.keymap.set("n", "<leader>e", function()
  require("mini.files").open(vim.api.nvim_buf_get_name(0))
end, { desc = "Quick file navigation" })

-- Buffer picker with native completion
vim.keymap.set('n', '<leader>o', ':buffer ')

-- Jump to previous buffer
-- BUG: doesn't work after netrw use
vim.keymap.set('n', '<leader><leader>', '<C-^>', {
  desc = 'Switch to last buffer',
})

-- See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<A-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<A-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<A-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<A-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Resize window using <ctrl> arrow keys
vim.keymap.set('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
vim.keymap.set('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- terminal

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

local new_term_job_id = 0
vim.keymap.set('n', '<space>bt', function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd 'J'
  vim.api.nvim_win_set_height(0, 10)

  new_term_job_id = vim.bo.channel
end, { desc = 'Open terminal terminal below' })

vim.keymap.set('n', '<space>bg', function()
  vim.fn.chansend(new_term_job_id, { 'go run main.go\r\n' })
end, { desc = 'Run go project in the tiny terminal' })

vim.keymap.set('n', '<space>bc', function()
  vim.fn.chansend(new_term_job_id, { 'cc main.c -o main && ./main\r\n' })
end, { desc = 'Run C project in the tiny terminal' })

vim.keymap.set('n', '<space>br', function()
  vim.fn.chansend(new_term_job_id, { 'cargo run .\r\n' })
end, { desc = 'Run cargo project in tiny terminal' })

vim.keymap.set('n', '<leader>b', '', { desc = 'Tiny terminal window' })
