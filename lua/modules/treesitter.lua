---------- 代码高亮 treesitter

local M = {
  plugins = {
    {'nvim-treesitter/nvim-treesitter', run = 'TSUpdate'},
  }
}

function M.setup()
  local ts = require('nvim-treesitter.configs')
  ts.setup({
    -- auto tag
    autotag = { enable = true },
    -- 高亮
    highlight = { enable = true },
    -- 缩进
    indent = { enable = true },
    -- 注释格式
    context_commentstring = {
      enable = true,
      enable_autocmd = false
    },
    -- 启用增量选择
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<CR>',
        node_incremental = '<CR>',
        node_decremental = '<BS>',
        scope_incremental = '<TAB>',
      }
    }
  })
  -- 折叠代码
  vim.o.foldmethod = "expr"
  vim.o.foldexpr = "nvim_treesitter#foldexpr()"
  -- 默认不折叠代码
  vim.o.foldlevel = 99
end

return M

