---------- which-key

local M = {
  'tomasky/bookmarks.nvim',
  keys = {
    { '<leader>m', desc = 'Bookmark' },
    -- add or remove bookmark at current line
    {
      '<leader>mm',
      mode = { 'n', 'v' },
      function()
        require('bookmarks').bookmark_toggle()
      end,
      desc = 'Bookmark Toggle',
    },
    -- add or edit mark annotation at current line
    {
      '<leader>mi',
      mode = { 'n', 'v' },
      function()
        require('bookmarks').bookmark_ann()
      end,
      desc = 'Bookmark Ann',
    },
    -- clean all marks in local buffer
    {
      '<leader>mc',
      mode = { 'n', 'v' },
      function()
        require('bookmarks').bookmark_clean()
      end,
      desc = 'Bookmark Clean',
    },
    -- jump to next mark in local buffer
    {
      '<leader>mn',
      mode = { 'n', 'v' },
      function()
        require('bookmarks').bookmark_next()
      end,
      desc = 'Bookmark Next',
    },
    -- jump to previous mark in local buffer
    {
      '<leader>mp',
      mode = { 'n', 'v' },
      function()
        require('bookmarks').bookmark_prev()
      end,
      desc = 'Bookmark Prev',
    },
    -- removes all bookmarks
    {
      '<leader>mx',
      mode = { 'n', 'v' },
      function()
        require('bookmarks').bookmark_clear_all()
      end,
      desc = 'Bookmark Clear All',
    },
    -- show marked file list
    {
      '<leader>ml',
      mode = { 'n', 'v' },
      function()
        require('telescope').extensions.bookmarks.list()
      end,
      desc = 'Bookmark List',
    },
  },
  config = function()
    require('bookmarks').setup({
      -- sign_priority = 8,  --set bookmark sign priority to cover other sign
      save_file = vim.fn.stdpath('data') .. '/.bookmarks', -- bookmarks save file path
      keywords = {
        ['@t'] = '☑️ ', -- mark annotation startswith @t ,signs this icon as `Todo`
        ['@w'] = '❗', -- mark annotation startswith @w ,signs this icon as `Warn`
        ['@f'] = '⛏ ', -- mark annotation startswith @f ,signs this icon as `Fix`
        ['@n'] = '📓', -- mark annotation startswith @n ,signs this icon as `Note`
      },
    })
    require('telescope').load_extension('bookmarks')
  end,
}

return M
