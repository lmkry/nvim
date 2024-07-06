return {
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'tsserver' }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { desc = 'LSP: ' .. desc })
      end
      map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
      map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
      map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
      --  Symbols are things like variables, functions, types, etc.
      map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
      --  Similar to document symbols, except searches over your entire project.
      map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
      -- Rename the variable under your cursor.
      map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      -- Opens a popup that displays documentation about the word under your cursor
      map('K', vim.lsp.buf.hover, 'Hover Documentation')
      map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    end
  }
}

-- return {
--   'hrsh7th/cmp-nvim-lsp',
--   config = function()
--     --  This function gets run when an LSP attaches to a particular buffer.
--     --    That is to say, every time a new file is opened that is associated with
--     --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
--     --    function will be executed to configure the current buffer
--     vim.api.nvim_create_autocmd('LspAttach', {
--       group = vim.api.nvim_create_augroup(
--         'kickstart-lsp-attach',
--         { clear = true }
--       ),
--       callback = function(event)
--         -- The following two autocommands are used to highlight references of the
--         -- word under your cursor when your cursor rests there for a little while.
--         -- When you move your cursor, the highlights will be cleared (the second autocommand).
--         local client = vim.lsp.get_client_by_id(event.data.client_id)
--         if client and client.server_capabilities.documentHighlightProvider then
--           local highlight_augroup = vim.api.nvim_create_augroup(
--             'kickstart-lsp-highlight',
--             { clear = false }
--           )
--           vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--             buffer = event.buf,
--             group = highlight_augroup,
--             callback = vim.lsp.buf.document_highlight,
--           })
--
--           vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
--             buffer = event.buf,
--             group = highlight_augroup,
--             callback = vim.lsp.buf.clear_references,
--           })
--
--           vim.api.nvim_create_autocmd('LspDetach', {
--             group = vim.api.nvim_create_augroup(
--               'kickstart-lsp-detach',
--               { clear = true }
--             ),
--             callback = function(event2)
--               vim.lsp.buf.clear_references()
--               vim.api.nvim_clear_autocmds {
--                 group = 'kickstart-lsp-highlight',
--                 buffer = event2.buf,
--               }
--             end,
--           })
--         end
--
--     })
-- }
