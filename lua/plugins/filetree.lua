---------- file tree

local M = {
  -- file tree
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    require("neo-tree").setup({
      -- close_if_last_window = true,
      window = {
        position = "left",
        width = 36,
        mappings = {
          ["o"] = "open",
        },
      },
    })
    local kb = require("config.keybindings")
    kb.add_prefix("f", "File")
    kb.bind_leader("ft", "<cmd>NeoTreeFocusToggle<cr>", "Open File Tree")
  end,
}

return M
