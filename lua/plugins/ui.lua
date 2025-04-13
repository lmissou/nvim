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
  -- dashboard alpha
  {
    'goolord/alpha-nvim',
    lazy = false,
    keys = {
      { '<leader>w', desc = 'Window' },
      {
        '<leader>ws',
        mode = { 'n', 'v' },
        '<cmd>Alpha<cr>',
        desc = 'Startify Window',
      },
    },
    config = function()
      require('alpha').setup(require('alpha.themes.startify').config)
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
