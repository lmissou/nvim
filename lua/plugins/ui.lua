---------- 主题等ui相关插件

local kb = require("config.keybindings")

local M = {
  -- themes
  {
    "sainnhe/sonokai",
    config = function()
      vim.o.termguicolors = true
      vim.g.sonokai_style = "andromeda"
      vim.cmd([[colorscheme sonokai]])
    end,
  },
  -- dashboard alpha
  {
    "goolord/alpha-nvim",
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
      kb.add_prefix("w", "Window")
      kb.bind_leader("ws", "<cmd>Alpha<cr>", "Startify Window")
    end,
  },
  -- buffer line
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup({})
    end,
  },
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup()
    end,
  },
  -- icons
  {
    "kyazdani42/nvim-web-devicons",
  },
}

return M
