-- [[ Basic Keymaps ]]

-- Diagnostic keymaps

-- <Leader>+d -> expand diagnostic message that the cursor is currently hovering over
vim.api.nvim_set_keymap(
  'n',
  '<Leader>d',
  "<cmd>lua vim.diagnostic.open_float(nil, { scope = 'line', border = 'rounded' })<CR>",
  { noremap = true, silent = true }
)

-- <Leader>+D -> expand all diagnostic messages
vim.keymap.set('n', '<Leader>D', function()
  local diagnostics = vim.diagnostic.get(0)
  if vim.tbl_isempty(diagnostics) then
    return
  end

  local lines = {}
  for _, d in ipairs(diagnostics) do
    local text = d.message:gsub('\n', ' ')
    table.insert(lines, string.format('%d:%d [%s] %s', d.lnum + 1, d.col + 1, vim.diagnostic.severity[d.severity], text))
  end

  vim.lsp.util.open_floating_preview(lines, 'plaintext', {
    border = 'rounded',
    max_width = 120,
  })
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- other keymaps

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- <Leader>+n -> toggle nvim tree
vim.keymap.set('n', '<Leader>n', function()
  require('nvim-tree.api').tree.toggle()
end, { noremap = true, silent = true })

-- <Leader>+g -> toggle lazygit
vim.keymap.set('n', '<leader>g', '<cmd>LazyGit<cr>', { desc = 'Open LazyGit' })

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Cycle to next split, run last command, cycle back
vim.api.nvim_create_user_command('C', function()
  vim.cmd 'wincmd w' -- Cycle to next window
  vim.fn.feedkeys('i', 'n')
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Up><CR>', true, false, true), 'n')
  vim.defer_fn(function()
    vim.cmd 'wincmd p' -- Go back to previous window
  end, 100) -- Wait 100ms for command to execute
end, {})

-- Cycle to next split, run last command, stay there
vim.api.nvim_create_user_command('CC', function()
  vim.cmd 'wincmd w' -- Cycle to next window
  vim.fn.feedkeys('i', 'n')
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Up><CR>', true, false, true), 'n')
end, {})

vim.api.nvim_create_user_command('T', function()
  vim.cmd 'vsplit' -- Create new vertical split (cursor goes to new right split)
  vim.cmd '30wincmd >' -- Widen current (right) split by 30
  vim.cmd 'wincmd h' -- Move to left split
  vim.cmd 'terminal' -- Open terminal in left split
  vim.cmd 'startinsert' -- Enter insert mode in terminal
end, {})

vim.keymap.set('n', '<leader>R', function()
  package.loaded['keymaps'] = nil
  package.loaded['plugins'] = nil
  vim.cmd 'source ~/.config/nvim/init.lua'
  print 'Config reloaded.'
end, { desc = 'Reload config' })
