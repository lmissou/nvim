---------- 按键映射

local M = {}

-- 设置leader键
vim.g.mapleader = " "

local default_keybind_opt = { noremap = true, silent = true }

-- 绑定快捷键
function M.bind_key(map, key, cmd, desc, opt)
  opt = vim.tbl_deep_extend("force", default_keybind_opt, opt or {})
  if desc ~= nil then
    opt.desc = desc
  end
  vim.keymap.set(map, key, cmd, opt)
end

-- 绑定leader快捷键
function M.bind_leader(key, cmd, desc, opt)
  M.bind_key("n", "<leader>" .. key, cmd, desc, opt)
end

-- 添加前缀按键描述信息
function M.add_prefix(key, desc)
  M.bind_leader(key, "<cmd><cr>", desc)
end

-- 添加leader快捷键
function M.add_leader_keymap(keymap, leader_sub_keymaps)
  leader_sub_keymaps = leader_sub_keymaps or M.leader_keymaps
  if type(keymap) ~= "table" then
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
  M.bind_key("i", "jk", "<esc>")
  M.bind_key("n", "<leader>q", "<cmd>q<cr>", "Quit")
  M.bind_key("n", "<C-s>", "<cmd>w<cr>", "Save Buffer")
  -- 复制粘贴系统剪贴板（复制：ctrl+c，粘贴：ctrl+shift+v）
  M.bind_key("v", "<C-c>", '"+y', "System Copy")
  M.bind_key("n", "<C-S-v>", '"+p', "System Paste")
  M.bind_key("v", "<C-S-v>", '"+p', "System Paste")
  -- 窗口切换
  M.add_prefix("w", "Window")
  M.bind_leader("wo", "<cmd>only<cr>", "Only current window")
  M.bind_leader("wh", "<cmd>vsplit<cr>", "VSplit window")
  M.bind_leader("wv", "<cmd>split<cr>", "Split window")
  -- Buffer切换
  M.add_prefix("b", "Buffer")
  M.bind_leader("bd", "<cmd>bdelete<cr>", "Delete buffers")
  M.bind_leader("bn", "<cmd>bnext<cr>", "Next buffer")
  M.bind_leader("bp", "<cmd>bprevious<cr>", "Previous buffer")
end

return M
