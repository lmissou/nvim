---------- git

local M = {
  -- git
  'lewis6991/gitsigns.nvim',
  lazy = false,
  keys = {
    { '<leader>g',  mode = { 'n', 'v' }, 'Git' },
    { '<leader>gs', mode = { 'n', 'v' }, '<cmd>Gitsigns stage_hunk<cr>', 'Stage hunk' },
    { '<leader>gr', mode = { 'n', 'v' }, '<cmd>Gitsigns reset_hunk<cr>', 'Reset hunk' },
    {
      '<leader>gS',
      mode = { 'n', 'v' },
      function()
        require('gitsigns').stage_buffer()
      end,
      desc = 'Stage buffer',
    },
    {
      '<leader>gu',
      mode = { 'n', 'v' },
      function()
        require('gitsigns').undo_stage_hunk()
      end,
      desc = 'Unstage hunk',
    },
    {
      '<leader>gR',
      mode = { 'n', 'v' },
      function()
        require('gitsigns').reset_buffer()
      end,
      desc = 'Reset buffer',
    },
    {
      '<leader>gp',
      mode = { 'n', 'v' },
      function()
        require('gitsigns').preview_hunk()
      end,
      desc = 'Preview hunk',
    },
    {
      '<leader>gB',
      mode = { 'n', 'v' },
      function()
        require('gitsigns').blame_line({ full = true })
      end,
      desc = 'Blame line',
    },
    {
      '<leader>gb',
      mode = { 'n', 'v' },
      function()
        require('gitsigns').toggle_current_line_blame()
      end,
      desc = 'Blame toggle',
    },
    {
      '<leader>gd',
      mode = { 'n', 'v' },
      function()
        require('gitsigns').diffthis()
      end,
      desc = 'Diff this',
    },
    {
      '<leader>gD',
      mode = { 'n', 'v' },
      function()
        require('gitsigns').diffthis('~')
      end,
      desc = 'Diff ~',
    },
  },
  opts = {
    current_line_blame = true,
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
}

return M
