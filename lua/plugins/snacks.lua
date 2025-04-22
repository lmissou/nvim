---------- snacks.nvim Neovim 的小型 QoL 插件集合

local M = {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    image = { enabled = true },
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    -- Snacks git
    { '<leader>g',  desc = 'Git' },
    { '<leader>gg', mode = { 'n', 'v' }, function() require('snacks.lazygit')() end,   desc = 'Lazygit' },
    -- Snacks dashboard
    { '<leader>w',  desc = 'Window' },
    { '<leader>ws', mode = { 'n', 'v' }, function() require('snacks.dashboard')() end,   desc = 'Dashboard' },
    -- Snacks picker
    { '<leader>b',  desc = 'Buffer' },
    { '<leader>bb', mode = { 'n', 'v' }, function() require('snacks.picker').buffers() end, desc = 'Buffers' },
    { '<leader>f',  desc = 'File' },
    { '<leader>ff', mode = { 'n', 'v' }, function() require('snacks.picker').files() end,   desc = 'Find File' },
    { '<C-p>',      mode = { 'n', 'v' }, function() require('snacks.picker').files() end,   desc = 'Find File' },
    { '<leader>fr', mode = { 'n', 'v' }, function() require('snacks.picker').recent() end,  desc = 'Open Recent File' },
    { '<leader>fg', mode = { 'n', 'v' }, function() require('snacks.picker').grep() end,    desc = 'Search string' },
  },
}

return M
