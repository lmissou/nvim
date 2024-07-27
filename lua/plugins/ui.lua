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
  -- buffer line
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    keys = {
      { '<leader>b', mode = { 'n', 'v' }, desc = 'Buffer' },
      { '<leader>bo', mode = { 'n', 'v' }, '<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>', desc = 'Only' },
      { '<leader>bb', mode = { 'n', 'v' }, '<cmd>BufferLinePick<cr>', desc = 'Pick' },
    },
    opts = {
      options = {
        separator_style = 'slant',
        always_show_bufferline = false,
        -- 使用 nvim 内置lsp
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match('error') and ' ' or ' '
          return ' ' .. icon .. count
        end,
        -- 左侧让出 nvim-tree 的位置
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            highlight = 'Directory',
            text_align = 'left',
          },
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    },
  },
}

return M
