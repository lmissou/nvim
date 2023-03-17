---------- lsp

local M = {
  plugins = {
    -- lsp config
    'neovim/nvim-lspconfig',
    -- lsp saga (ui)
    'tami5/lspsaga.nvim',
    -- lsp icon
    'onsails/lspkind-nvim',
    -- mason-lspconfig
    'williamboman/mason-lspconfig.nvim',
  }
}

function M.setup()
  -- lsp saga
  require('lspsaga').init_lsp_saga()
  -- lsp config
  local mason_lspconfig = require('mason-lspconfig')
  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(_, bufnr)
    local opts = { noremap=true, silent=true }
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
    vim.api.nvim_set_keymap('n', '[d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
    vim.api.nvim_set_keymap('n', ']d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
    -- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>Lspsaga preview_definition<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>Lspsaga hover_doc<CR>',opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>Lspsaga signature_help<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', '<cmd>Lspsaga rename<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', '<cmd>Lspsaga code_action<CR>', opts)
  end
  -- Setup mason-lspconfig.
  mason_lspconfig.setup({})
  mason_lspconfig.setup_handlers({
    function(server_name)
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
      require("lspconfig")[server_name].setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
    end
  })
end

return M

