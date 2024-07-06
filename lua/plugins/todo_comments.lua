return {
  -- Highlight TODO, NOTE, FIX, WARNING, HACK, PERF 
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
}
