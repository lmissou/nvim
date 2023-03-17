---------- mason(lsp,dap,linter...的安装工具)

local M = {
  plugins = {
    -- mason
    'williamboman/mason.nvim',
  }
}

function M.setup()
  require('mason').setup({})
end

return M

