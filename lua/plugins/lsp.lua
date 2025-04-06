---------- lsp

-- Use an on_attach function to only map the following keys
function on_lsp_attach(_, bufnr)
  local opts = { noremap = true, silent = true }
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
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
  config = function()
    -- mason
    require('mason').setup()
    -- lsp saga
    require('lspsaga').setup()
    -- lsp config
    local mason_lspconfig = require('mason-lspconfig')
    -- Setup mason-lspconfig.
    mason_lspconfig.setup({})
    mason_lspconfig.setup_handlers({
      function(server_name)
        local capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
        capabilities.textDocument.foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true
        }
        local server_config = {
          capabilities = capabilities,
          on_attach = on_lsp_attach,
        }
        -- 修复volar2报错问题
        local vue_language_server_path = vim.fn.stdpath('data') ..
            '/mason/packages/vue-language-server/node_modules/@vue/language-server'
        if server_name == 'tsserver' then
          server_config.init_options = {}
          if vim.loop.fs_stat(vue_language_server_path) then
            server_config.init_options.plugins = {
              {
                name = '@vue/typescript-plugin',
                location = vue_language_server_path,
                languages = { 'vue' },
              },
            }
          end
        elseif server_name == 'volar' then
          server_config.init_options = {
            vue = {
              hybridMode = false,
            },
          }
        end
        require('lspconfig')[server_name].setup(server_config)
      end,
    })
  end,
  -- after the language server attaches to the current buffer
  on_lsp_attach = on_lsp_attach,
}

return M
