---------- 主题等ui相关插件

local kb = require('config.keybindings')

local M = {
  -- themes
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    config = function()
      require('catppuccin').setup({
        -- latte, frappe, macchiato, mocha
        background = {
          light = 'latte',
          dark = 'macchiato',
        },
      })
      vim.o.termguicolors = true
      vim.o.background = 'dark'
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  -- lualine
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },
}

return M
