return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',

  config = function()
    require('bufferline').setup()
  end,

  vim.keymap.set('n', '<tab>', '<cmd>BufferLineCycleNext<CR>'),
  vim.keymap.set('n', '<S-tab>', '<cmd>BufferLineCyclePrev<CR>'),
  vim.keymap.set('n', '<leader>x', '<cmd>bdelete<CR>'),
}
