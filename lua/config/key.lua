local wk = require'which-key'

wk.setup{}
-- 设置leader键
vim.g.mapleader =' '
-- 设置快捷键
vim.api.nvim_set_keymap('i', 'jk', '<esc>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<cr>', { noremap = true })

local keymaps = {
  w = {
    name = 'window',
    s = { '<cmd>Alpha<cr>', 'VSplit window' },
    h = { '<cmd>vsplit<cr>', 'VSplit window' },
    v = { '<cmd>split<cr>', 'Split window' },
  },
  b = {
    name = 'buffer',
    b = { '<cmd>Telescope buffers<cr>', 'Switch buffers' },
    d = { '<cmd>bdelete<cr>', 'Delete buffers' },
    n = { '<cmd>bnext<cr>', 'Next buffer' },
    p = { '<cmd>bprevious<cr>', 'Previous buffer' },
  },
  f = {
    name = 'file',
    f = { '<cmd>Telescope find_files<cr>', 'Find File' },
    r = { '<cmd>Telescope oldfiles<cr>', 'Open Recent File' },
    t = { '<cmd>NvimTreeToggle<cr>', 'Open File Tree' },
    s = { '<cmd>Telescope live_grep<cr>', 'Search string' },
  },
}

keymaps[vim.g.mapleader] = {
  name = 'motion',
  l = { '<cmd>HopLine<cr>', 'Goto line' },
  j = { '<cmd>HopLineAC<cr>', 'Goto line below' },
  k = { '<cmd>HopLineBC<cr>', 'Goto line above' },
  w = { '<cmd>HopWord<cr>', 'Goto word' },
  s = { '<cmd>HopPattern<cr>', 'Goto pattern(search)' },
  c = { '<cmd>HopChar1<cr>', 'Goto char' },
  C = { '<cmd>HopChar2<cr>', 'Goto char2' },
}

wk.register(keymaps, { prefix = '<leader>' })

