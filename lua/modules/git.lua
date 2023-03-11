---------- git

local M = {
  plugins = {
    -- git
    'lewis6991/gitsigns.nvim',
  }
}

local status_ok, gs = pcall(require, 'gitsigns')
if not status_ok then
  return M
end

M.nmap = {
  {']c', '&diff ? "]c" : "<cmd>Gitsigns next_hunk<CR>"', { expr = true }},
  {'[c', '&diff ? "[c" : "<cmd>Gitsigns prev_hunk<CR>"', { expr = true }},
}

M.lmap = {
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
}

function M.setup()
  require('gitsigns').setup({
    current_line_blame = true
  })
end

return M

