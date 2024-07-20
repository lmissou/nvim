---------- 代码高亮 treesitter

local M = {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      -- 彩虹括号
      "hiphish/rainbow-delimiters.nvim",
    },
    config = function()
      local ts = require("nvim-treesitter.configs")
      ts.setup({
        -- 高亮
        highlight = { enable = true },
        -- 缩进
        indent = { enable = true },
        -- 注释格式
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
        -- 启用增量选择
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
          },
        },
        -- 彩虹括号
        rainbow = {
          enable = true,
          -- list of languages you want to disable the plugin for
          disable = {},
          -- Which query to use for finding delimiters
          query = "rainbow-delimiters",
          -- Highlight the entire buffer all at once
          strategy = require("rainbow-delimiters.strategy.global"),
        },
      })
      -- auto tag
      require("nvim-ts-autotag").setup()
      -- 折叠代码
      vim.o.foldmethod = "expr"
      vim.o.foldexpr = "nvim_treesitter#foldexpr()"
      -- 默认不折叠代码
      vim.o.foldlevel = 99
    end,
  },
}

return M
