---------- 按键映射

local M = {}

-- 设置leader键
vim.g.mapleader = ' '

local default_keybind_opt = { noremap = true, silent = true }

-- 绑定快捷键
function M.bind_key(map, key, cmd, desc, opt)
  opt = vim.tbl_deep_extend('force', default_keybind_opt, opt or {})
  if desc ~= nil then
    opt.desc = desc
  end
  vim.keymap.set(map, key, cmd, opt)
end

-- 绑定leader快捷键
function M.bind_leader(key, cmd, desc, opt)
  M.bind_key({ 'n', 'v' }, '<leader>' .. key, cmd, desc, opt)
end

-- 添加前缀按键描述信息
function M.add_prefix(key, desc)
  M.bind_leader(key, '', desc)
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
  M.bind_leader('q', '<cmd>q<cr>', 'Quit')
  M.bind_key({ 'n', 'v' }, '<C-s>', '<cmd>w<cr>', 'Save Buffer')
  M.bind_key({ 'n', 'v' }, 'gh', '0')
  M.bind_key({ 'n', 'v' }, 'gl', '$')
  -- 复制粘贴系统剪贴板（复制：gy/ctrl+shift+c，粘贴：gp/ctrl+shift+v）
  M.bind_key({ 'n', 'v' }, 'gy', '"+y')
  M.bind_key({ 'n', 'v' }, 'gp', '"+p')
  M.bind_key('v', '<C-S-c>', '"+y', 'System Copy')
  M.bind_key({ 'n', 'v', 'i' }, '<C-S-v>', '"+p', 'System Paste')
  -- 窗口切换
  M.add_prefix('w', 'Window')
  M.bind_leader('wo', '<cmd>only<cr>', 'Only current window')
  M.bind_leader('ws', '<cmd>split<cr>', 'Split window')
  M.bind_leader('wv', '<cmd>vsplit<cr>', 'Split window vertically')
  M.bind_key({ 'n', 'v', 'i' }, '<C-h>', '<C-w>h', 'Go to the left window')
  M.bind_key({ 'n', 'v', 'i' }, '<C-j>', '<C-w>j', 'Go to the down window')
  M.bind_key({ 'n', 'v', 'i' }, '<C-k>', '<C-w>k', 'Go to the up window')
  M.bind_key({ 'n', 'v', 'i' }, '<C-l>', '<C-w>l', 'Go to the right window')
  M.bind_key({ 'n', 'v', 'i' }, '<C-M-h>', '<C-w><', 'Go to the left window')
  M.bind_key({ 'n', 'v', 'i' }, '<C-M-j>', '<C-w>+', 'Go to the down window')
  M.bind_key({ 'n', 'v', 'i' }, '<C-M-k>', '<C-w>-', 'Go to the up window')
  M.bind_key({ 'n', 'v', 'i' }, '<C-M-l>', '<C-w>>', 'Go to the right window')
  -- Buffer切换
  M.add_prefix('b', 'Buffer')
  M.bind_key({ 'n', 'v' }, '<C-w>d', '<cmd>bdelete<cr>', 'Close buffer')
  M.bind_key({ 'n', 'v' }, '<S-l>', '<cmd>bnext<cr>', 'Next buffer')
  M.bind_key({ 'n', 'v' }, '<S-h>', '<cmd>bprevious<cr>', 'Previous buffer')
  M.bind_leader('bd', '<cmd>bdelete<cr>', 'Delete buffers')
  M.bind_leader('bn', '<cmd>bnext<cr>', 'Next buffer')
  M.bind_leader('bp', '<cmd>bprevious<cr>', 'Previous buffer')
  M.bind_leader('bo', '<cmd>execute \'%bd|e#|normal `"\'|bdelete#<cr>', 'Only')
  M.add_prefix('f', 'File')
  M.bind_leader(
    'fc',
    function()
      local cur_buf_path = vim.fn.expand('%:h')
      if cur_buf_path == nil then
        cur_buf_path = './'
      end
      vim.ui.input({
        prompt = 'Enter path',
        completion = 'file',
        default = cur_buf_path,
      }, function(dir)
        if dir == nil or dir == '' then
          return
        end
        vim.api.nvim_set_current_dir(dir)
      end)
    end,
    'Ch pwd'
  )
end

return M
