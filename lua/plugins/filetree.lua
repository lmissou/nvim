---------- file tree

local M = {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  },
  lazy = false,
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    -- fill any relevant options here
    window = {
      mappings = {
        ["<space>"] = "",
        ["L"] = "focus_preview",
        ["<tab>"] = "toggle_node",
        ["."] = "toggle_hidden",
        ["h"] = "navigate_up",
        ["l"] = "set_root",
      }
    }
  },
  keys = {
    { '<leader>f',  desc = 'File' },
    { '<leader>ft', mode = { 'n' }, '<cmd>Neotree left toggle<cr>',  desc = 'File Tree toggle' },
    { '<leader>fe', mode = { 'n' }, '<cmd>Neotree float toggle<cr>', desc = 'File Tree (float)' },
  }
}

return M
