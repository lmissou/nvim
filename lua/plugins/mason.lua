---------- mason(lsp,dap,linter...的安装工具)

local M = {
  -- mason
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup({})
  end,
}

return M
