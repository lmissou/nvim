---------- which-key

local M = {
  'folke/which-key.nvim',
  lazy = false,
  opts = {
    preset = "helix", -- "classic" | "modern" | "helix"
  },
  keys = {
    {
      '<leader>?',
      mode = { 'n', 'v' },
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Buffer Local Keymaps',
    },
  },
  config = function(ctx, opts)
    require('which-key').setup(opts)
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
}

return M
