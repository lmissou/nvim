---------- 模糊查找

local M = {
  {
    -- fuzzy finder
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
        },
      })
      local kb = require("config.keybindings")
      kb.add_prefix("b", "Buffer")
      kb.bind_leader("bl", "<cmd>Telescope buffers<cr>", "Buffers")
      kb.add_prefix("f", "File")
      kb.bind_leader("ff", "<cmd>Telescope find_files<cr>", "Find File")
      kb.bind_leader("fp", "<cmd>Telescope projects<cr>", "Find Project")
      kb.bind_leader("fr", "<cmd>Telescope oldfiles<cr>", "Open Recent File")
      kb.bind_leader("fs", "<cmd>Telescope live_grep<cr>", "Search string")
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").load_extension("file_browser")
      local kb = require("config.keybindings")
      kb.add_prefix("f", "File")
      kb.bind_leader("fb", "<cmd>Telescope file_browser<cr>", "File Browser")
    end,
  },
}

return M
