--------- 快速移动光标

local M = {
  {
    'folke/flash.nvim',
    opts = {
      label = {
        uppercase = false,
      },
    },
    keys = {
      'f',
      'F',
      't',
      'T',
      ';',
      ',',
      {
        'S',
        mode = { 'n', 'x' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
      },
      {
        'r',
        mode = 'o',
        function()
          require('flash').remote()
        end,
        desc = 'Remote Flash',
      },
      {
        'R',
        mode = { 'o', 'x' },
        function()
          require('flash').treesitter_search()
        end,
        desc = 'Treesitter Search',
      },
      {
        '<c-s>',
        mode = { 'c' },
        function()
          require('flash').toggle()
        end,
        desc = 'Toggle Flash Search',
      },
    },
  },
  {
    'rainzm/flash-zh.nvim',
    dependencies = 'folke/flash.nvim',
    keys = {
      {
        's',
        mode = { 'n', 'x' },
        function()
          require('flash-zh').jump({})
        end,
        desc = 'Flash',
      },
      {
        'g/',
        mode = { 'n', 'x' },
        function()
          require('flash-zh').jump({})
        end,
        desc = 'Flash',
      },
      {
        'gw',
        mode = { 'n', 'x' },
        function()
          require('flash-zh').jump({
            pattern = '.', -- initialize pattern with any char
            search = {
              mode = function(pattern)
                -- remove leading dot
                if pattern:sub(1, 1) == '.' then
                  pattern = pattern:sub(2)
                end
                -- return word pattern and proper skip pattern
                return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
              end,
            },
            -- select the range
            jump = { pos = 'range' },
          })
        end,
        desc = 'Flash',
      },
    },
  },
}

return M
