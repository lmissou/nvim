---------- which-key

local M = {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup({
      -- or leave it empty to use the default settings
      -- your configuration comes here
      -- refer to the configuration section below
    })
  end,
}

return M
