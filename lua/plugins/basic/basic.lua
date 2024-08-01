---------- 基础配置相关插件

local M = {
  -- root权限读写文件
  {
    'lambdalisue/suda.vim',
  },
  -- surround
  {
    'kylechui/nvim-surround',
    opts = {},
  },
  -- 区域移动文本 Alt + h/j/k/l
  {
    'fedepujol/move.nvim',
    opts = {
      char = {
        enable = true, -- Enables char movement
      },
    },
    keys = {
      -- Normal-mode commands
      { '<M-j>', mode = 'n', ':MoveLine(1)<cr>' },
      { '<M-k>', mode = 'n', ':MoveLine(-1)<cr>' },
      { '<M-h>', mode = 'n', ':MoveHChar(-1)<cr>' },
      { '<M-l>', mode = 'n', ':MoveHChar(1)<cr>' },
      -- Visual-mode commands
      { '<M-j>', mode = 'v', ':MoveBlock(1)<cr>' },
      { '<M-k>', mode = 'v', ':MoveBlock(-1)<cr>' },
      { '<M-h>', mode = 'v', ':MoveHBlock(-1)<cr>' },
      { '<M-l>', mode = 'v', ':MoveHBlock(1)<cr>' },
    },
  },
  -- 多行缩进
  {
    'joshnavdev/indentation-multiline.nvim',
    opts = {
      -- Mapping for right-intent
      indent_mapping = '>',
      -- Mapping for left-intent
      unindent_mapping = '<',
    },
  },
}

return M
