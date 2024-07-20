---------- which-key

local M = {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    local kb = require("config.keybindings")
    kb.bind_leader("?", function()
      require("which-key").show({ global = false })
    end, "Buffer Local Keymaps")
  end,
}

return M
