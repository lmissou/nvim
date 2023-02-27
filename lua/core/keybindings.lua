---------- 按键映射

local wk = require'which-key'

local M = {
  leader_keymaps = {}
}

-- 设置leader键
vim.g.mapleader = ' '

local default_keybind_opt = {noremap = true, silent = true}

-- 绑定快捷键
function M.bind_key(map, key, cmd, opt)
  vim.api.nvim_set_keymap(map, key, cmd, opt or default_keybind_opt)
end
-- 添加leader快捷键
function M.add_leader_keymap(keymap, leader_sub_keymaps)
  leader_sub_keymaps = leader_sub_keymaps or M.leader_keymaps
  if type(keymap) ~= 'table' then
    return
  end
  for k, v in pairs(keymap) do
    -- 不存在快捷键映射直接赋值
    if not leader_sub_keymaps[k] then
      leader_sub_keymaps[k] = v
    else
      M.add_leader_keymap(v, leader_sub_keymaps[k])
    end
  end
end

function M.setup()
  -- 设置快捷键
  M.bind_key('i', 'jk', '<esc>')
  M.bind_key('n', '<leader>q', '<cmd>q<cr>')
  M.bind_key('n', '<C-s>', '<cmd>w<cr>')
  -- 复制粘贴系统剪贴板
  M.bind_key('v', '<C-y>', '"+y')
  M.bind_key('n', '<C-y>', '"+y')
  M.bind_key('n', '<C-p>', '"+p')
  M.bind_key('v', '<C-p>', '"+p')
  -- 使用which-key注册leader快捷键
  wk.register(M.leader_keymaps, { prefix = '<leader>' })
end

return M

