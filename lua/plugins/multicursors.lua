---------- multi cursors edit

local M = {
  "jake-stewart/multicursor.nvim",
  keys = {
    -- Add or skip cursor above/below the main cursor.
    { "<C-M-Up>",   function() require('multicursor-nvim').lineAddCursor(-1) end,   mode = { "n", "x" }, desc = "LineAddCursorUp" },
    { "<C-M-Down>", function() require('multicursor-nvim').lineAddCursor(1) end,    mode = { "n", "x" }, desc = "LineAddCursorDown" },
    { "<M-Up>",     function() require('multicursor-nvim').lineSkipCursor(-1) end,  mode = { "n", "x" }, desc = "LineSkipCursorUp" },
    { "<M-Down>",   function() require('multicursor-nvim').lineSkipCursor(1) end,   mode = { "n", "x" }, desc = "LineSkipCursorDown" },
    { "<C-M-k>",    function() require('multicursor-nvim').lineAddCursor(-1) end,   mode = { "n", "x" }, desc = "LineAddCursorUp" },
    { "<C-M-j>",    function() require('multicursor-nvim').lineAddCursor(1) end,    mode = { "n", "x" }, desc = "LineAddCursorDown" },
    { "<M-k>",      function() require('multicursor-nvim').lineSkipCursor(-1) end,  mode = { "n", "x" }, desc = "LineSkipCursorUp" },
    { "<M-j>",      function() require('multicursor-nvim').lineSkipCursor(1) end,   mode = { "n", "x" }, desc = "LineSkipCursorDown" },
    -- Add or skip adding a new cursor by matching word/selection
    { "<leader>cc", function() require('multicursor-nvim').matchAddCursor(1) end,   mode = { "n", "x" }, desc = "MatchAddCursor" },
    { "<leader>cx", function() require('multicursor-nvim').matchSkipCursor(1) end,  mode = { "n", "x" }, desc = "MatchSkipCursor" },
    { "<leader>cC", function() require('multicursor-nvim').matchAddCursor(-1) end,  mode = { "n", "x" }, desc = "MatchAddCursor" },
    { "<leader>cX", function() require('multicursor-nvim').matchSkipCursor(-1) end, mode = { "n", "x" }, desc = "MatchSkipCursor" },
  },
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()
    local set = vim.keymap.set
    -- Mappings defined in a keymap layer only apply when there are
    -- multiple cursors. This lets you have overlapping mappings.
    mc.addKeymapLayer(function(layerSet)
      -- Select a different cursor as the main one.
      layerSet({ "n", "x" }, "<left>", mc.prevCursor)
      layerSet({ "n", "x" }, "<right>", mc.nextCursor)
      -- Delete the main cursor.
      layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)
      -- Enable and clear cursors using escape.
      layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)
    -- Add and remove cursors with control + left click.
    set("n", "<c-leftmouse>", mc.handleMouse)
    set("n", "<c-leftdrag>", mc.handleMouseDrag)
    set("n", "<c-leftrelease>", mc.handleMouseRelease)
    -- Disable and enable cursors.
    set({ "n", "x" }, "<c-q>", mc.toggleCursor)
    -- Customize how cursors look.
    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorCursor", { reverse = true })
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorSign", { link = "SignColumn" })
    hl(0, "MultiCursorMatchPreview", { link = "Search" })
    hl(0, "MultiCursorDisabledCursor", { reverse = true })
    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
  end
}

return M
