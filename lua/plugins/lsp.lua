---------- lsp

-- Use an on_attach function to only map the following keys
function on_lsp_attach(_, bufnr)
  local opts = { noremap = true, silent = true }
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = bufnr })
  -- Mappings.
  -- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>Lspsaga preview_definition<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>Lspsaga goto_definition<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>Lspsaga finder<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', '<cmd>Lspsaga rename<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', '<cmd>Lspsaga code_action<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>le', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lo', '<cmd>Lspsaga outline<CR>', opts)
end

local M = {
  -- lsp config
  'neovim/nvim-lspconfig',
  dependencies = {
    -- cmp
    'saghen/blink.cmp',
    -- lsp saga (ui)
    'nvimdev/lspsaga.nvim',
    -- mason
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  event = 'VeryLazy',
  keys = {
    { '<leader>l',  desc = 'Lsp' },
    { '<leader>lm', mode = 'n',  '<cmd>Mason<CR>', desc = 'Mason' },
  },
  config = function()
    -- mason
    require('mason').setup()
    -- lsp saga
    require('lspsaga').setup()
    -- lsp config
    local mason_lspconfig = require('mason-lspconfig')
    -- Setup mason-lspconfig.
    mason_lspconfig.setup({ automatic_enable = true, })
    local capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
    vim.lsp.config('*', {
      capabilities = capabilities,
      on_attach = on_lsp_attach,
    })
    vim.lsp.config('volar', {
      on_attach = on_lsp_attach,
      capabilities = capabilities,
      init_options = {
        vue = {
          hybridMode = false,
        },
      }
    })
  end,
  -- after the language server attaches to the current buffer
  on_lsp_attach = on_lsp_attach,
}

return M
