---------- git

local M = {
  -- git
  "lewis6991/gitsigns.nvim",
  config = function()
    local gs = require("gitsigns")
    gs.setup({
      current_line_blame = true,
    })
    local kb = require("config.keybindings")
    kb.bind_key("n", "]c", '&diff ? "]c" : "<cmd>Gitsigns next_hunk<CR>"')
    kb.bind_key("n", "[c", '&diff ? "[c" : "<cmd>Gitsigns prev_hunk<CR>"')
    kb.add_prefix("g", "Git")
    kb.bind_leader("gs", '<cmd>Gitsigns stage_hunk<cr>', 'Stage hunk')
    kb.bind_leader("gr", '<cmd>Gitsigns reset_hunk<cr>', 'Reset hunk')
    kb.bind_leader("gS", gs.stage_buffer, 'Stage buffer')
    kb.bind_leader("gu", gs.undo_stage_hunk, 'Unstage hunk')
    kb.bind_leader("gR", gs.reset_buffer, 'Reset buffer')
    kb.bind_leader("gp", gs.preview_hunk, 'Preview hunk')
    kb.bind_leader("gB", function() gs.blame_line{full=true} end, 'Blame line')
    kb.bind_leader("gb", gs.toggle_current_line_blame, 'Blame toggle')
    kb.bind_leader("gd", gs.diffthis, 'Diff this')
    kb.bind_leader("gD", function() gs.diffthis('~') end, 'Diff ~')
  end,
}

return M
