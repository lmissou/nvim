local wk = require'which-key'
local gs = require'gitsigns'

wk.setup{}
-- 设置leader键
vim.g.mapleader =' '
-- 设置快捷键
vim.api.nvim_set_keymap('i', 'jk', '<esc>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<cr>', { noremap = true })
-- Gitsigns keymap
vim.api.nvim_set_keymap('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
vim.api.nvim_set_keymap('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})
-- vim.api.nvim_set_keymap({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')

local keymaps = {
  w = {
    name = 'Window',
    s = { '<cmd>Alpha<cr>', 'VSplit window' },
    h = { '<cmd>vsplit<cr>', 'VSplit window' },
    v = { '<cmd>split<cr>', 'Split window' },
  },
  b = {
    name = 'Buffer',
    b = { '<cmd>Telescope buffers<cr>', 'Switch buffers' },
    d = { '<cmd>bdelete<cr>', 'Delete buffers' },
    n = { '<cmd>bnext<cr>', 'Next buffer' },
    p = { '<cmd>bprevious<cr>', 'Previous buffer' },
  },
  f = {
    name = 'File',
    f = { '<cmd>Telescope find_files<cr>', 'Find File' },
    r = { '<cmd>Telescope oldfiles<cr>', 'Open Recent File' },
    t = { '<cmd>NvimTreeToggle<cr>', 'Open File Tree' },
    s = { '<cmd>Telescope live_grep<cr>', 'Search string' },
  },
  g = {
    name = 'Git',
    s = { '<cmd>Gitsigns stage_hunk<cr>', 'Stage hunk' },
    r = { '<cmd>Gitsigns reset_hunk<cr>', 'Reset hunk' },
    S = { gs.stage_buffer, 'Stage buffer' },
    u = { gs.undo_stage_hunk, 'Unstage hunk' },
    R = { gs.reset_buffer, 'Reset buffer' },
    p = { gs.preview_hunk, 'Preview hunk' },
    B = { function() gs.blame_line{full=true} end, 'Blame line' },
    b = { gs.toggle_current_line_blame, 'Blame toggle' },
    d = { gs.diffthis, 'Diff this' },
    D = { function() gs.diffthis('~') end, 'Diff ~' },
  },
  t = {
    name = 'Terminal',
    t = { '<cmd>ToggleTerm 0<cr>', 'Open terminal' },
  },
}

-- terminal
for i = 1, 9, 1 do
  keymaps.t[tostring(i)] = { '<cmd>ToggleTerm '..i..'<cr>', 'Open terminal'..i }
end

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

