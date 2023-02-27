---------- 快速移动光标

local M = {
  plugins = {
    'phaazon/hop.nvim',
  }
}

M.nmap = {
  -- motion (hop)
  {'s', '<cmd>HopChar2<cr>'},
  {'S', '<cmd>HopWord<cr>'},
  {'gw', '<cmd>HopWord<cr>'},
  {'gl', '<cmd>HopLine<cr>'},
  {'gs', '<cmd>HopPattern<cr>'},
  {'gC', '<cmd>HopChar2<cr>'},
}
M.lmap = {
  [vim.g.mapleader] = {
    name = 'motion',
    l = { '<cmd>HopLine<cr>', 'Goto line' },
    j = { '<cmd>HopLineAC<cr>', 'Goto line below' },
    k = { '<cmd>HopLineBC<cr>', 'Goto line above' },
    w = { '<cmd>HopWord<cr>', 'Goto word' },
    s = { '<cmd>HopPattern<cr>', 'Goto pattern(search)' },
    c = { '<cmd>HopChar1<cr>', 'Goto char' },
    C = { '<cmd>HopChar2<cr>', 'Goto char2' },
  }
}

function M.setup()
  local hop = require('hop')
  hop.setup()
end

return M

