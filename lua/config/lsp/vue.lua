---------- vue_ls config
local M = {};

function get_vue_plugin()
  local vue_plugin = {}
  local has_mason, mason_registry = pcall(require, 'mason-registry')

  if has_mason then
    local has_vue_lsp = pcall(mason_registry.get_package, 'vue-language-server')
    if has_vue_lsp then
      local vue_ts_plugin_path = vim.fn.expand('$MASON/packages/vue-language-server/node_modules/@vue/language-server')
      vue_plugin = {
        name = '@vue/typescript-plugin',
        location = vue_ts_plugin_path,
        languages = { 'vue' },
        configNamespace = 'typescript',
        enableForWorkspaceTypeScriptVersions = true,
      }
    end
  end

  return vue_plugin
end

M.setup = function(on_lsp_attach)
  local capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- capabilities.textDocument.foldingRange = {
  --   dynamicRegistration = false,
  --   lineFoldingOnly = true
  -- }
  local server_name = 'ts_ls'
  local ts_fts = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact', 'vue' }
  local vue_plugin = get_vue_plugin()
  local server_config = {
    capabilities = capabilities,
    on_attach = on_lsp_attach,
    init_options = {
      plugins = {
        vue_plugin,
      },
    },
    filetypes = ts_fts,
  }
  vim.lsp.config(server_name, server_config)
  vim.lsp.enable(server_name)
end

return M
