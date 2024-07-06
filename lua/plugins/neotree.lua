return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  config = function()
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
      },
      buffers = { follow_current_file = { enable = true } },
    })
  end,

  vim.keymap.set('n', '<leader>n', ':Neotree reveal toggle float<CR>', {}),
  vim.keymap.set('n', '<leader>gs', ':Neotree git_status toggle float<CR>', {}),
}
