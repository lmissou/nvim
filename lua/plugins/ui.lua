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
      require("bufferline").setup({
        options = {
          separator_style = "slant",
          hover = {
            enabled = true,
            delay = 200,
            reveal = { 'close' }
          },
          -- always_show_bufferline = false,
          -- 使用 nvim 内置lsp
          diagnostics = "nvim_lsp",
          -- 左侧让出 nvim-tree 的位置
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "left",
            },
          },
        },
      })
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
