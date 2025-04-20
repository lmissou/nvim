---------- 区域移动文本

local M = {
  -- 区域移动文本 Alt + Shift + h/j/k/l
  {
    'fedepujol/move.nvim',
    opts = {
      char = {
        enable = true, -- Enables char movement
      },
    },
    keys = {
      -- Normal-mode commands
      { '<M-S-j>', mode = 'n', ':MoveLine(1)<cr>' },
      { '<M-S-k>', mode = 'n', ':MoveLine(-1)<cr>' },
      { '<M-S-h>', mode = 'n', ':MoveHChar(-1)<cr>' },
      { '<M-S-l>', mode = 'n', ':MoveHChar(1)<cr>' },
      -- Visual-mode commands
      { '<M-S-j>', mode = 'v', ':MoveBlock(1)<cr>' },
      { '<M-S-k>', mode = 'v', ':MoveBlock(-1)<cr>' },
      { '<M-S-h>', mode = 'v', ':MoveHBlock(-1)<cr>' },
      { '<M-S-l>', mode = 'v', ':MoveHBlock(1)<cr>' },
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
