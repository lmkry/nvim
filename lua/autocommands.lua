-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup(
    'kickstart-highlight-yank',
    { clear = true }
  ),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('ColorScheme', {
  command = [[
    highlight CursorLine cterm=NONE ctermbg=236 ctermfg=NONE guibg=#3c444f guifg=NONE
    highlight Comment ctermfg=NONE guifg=#739e7d
    highlight CursorLineNr ctermfg=NONE guifg=#FF79C6
  ]]})
