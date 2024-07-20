---------- 主题等ui相关插件

local kb = require("config.keybindings")

local M = {
  -- themes
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = function()
      vim.o.termguicolors = true
      require("catppuccin").setup({
        -- flavour = "frappe", -- latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "frappe",
        },
      })
      vim.cmd([[colorscheme catppuccin]])
      vim.o.background = "dark"
    end,
  },
  -- dashboard alpha
  {
    "goolord/alpha-nvim",
    lazy = false,
    keys = {
      { "<leader>w", desc = "Window" },
      {
        "<leader>ws",
        mode = "n",
        "<cmd>Alpha<cr>",
        desc = "Startify Window",
      },
    },
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
  },
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({})
    end,
  },
  -- buffer line
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    keys = {
      { "<leader>b", mode = "n", desc = "Buffer" },
      { "<leader>bo", mode = "n", "<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>", desc = "Only" },
      { "<leader>bb", mode = "n", "<cmd>BufferLinePick<cr>", desc = "Pick" },
    },
    config = function()
      require("bufferline").setup({
        options = {
          separator_style = "slant",
          always_show_bufferline = false,
          -- 使用 nvim 内置lsp
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,
          -- 左侧让出 nvim-tree 的位置
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "left",
            },
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
}

return M
