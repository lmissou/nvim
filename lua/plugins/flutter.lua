---------- flutter

local M = {
  'akinsho/flutter-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim',
    -- cmp
    'saghen/blink.cmp',
  },
  ft = 'dart',
  config = function()
    -- Setup flutter(dart) lsp
    local capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
    local on_lsp_attach = require('plugins.lsp').on_lsp_attach
    require('flutter-tools').setup({
      lsp = {
        capabilities = capabilities,
        on_attach = on_lsp_attach,
      },
    })
  end,
}

return M
