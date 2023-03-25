---------- file tree

local M = {
  -- file tree
  "kyazdani42/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup({
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
    })
    vim.g.nvim_tree_respect_buf_cwd = 1
    local kb = require("config.keybindings")
    kb.add_prefix("f", "File")
    kb.bind_leader("ft", "<cmd>NvimTreeToggle<cr>", "Open File Tree")
  end,
}

return M
