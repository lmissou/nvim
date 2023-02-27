---------- 加载模块

local utils = require('core.utils')
local kb = require('core.keybindings')

vim.cmd [[packadd packer.nvim]]
local packer = require('packer')

local M = {
  modules_path = 'modules',
  plugins = {
    'wbthomason/packer.nvim',
    'folke/which-key.nvim',
  }
}


-- 初始化模块
function init_module(module)
  utils.array_concat(M.plugins, module.plugins)
  -- normal模式快捷键绑定
  if type(module.nmap) == 'table' then
    for i = 1, #module.nmap do
      local keybind = module.nmap[i]
      kb.bind_key('n', keybind[1], keybind[2], keybind[3])
    end
  end
  -- 添加leader快捷键
  if type(module.lmap) == 'table' then
    kb.add_leader_keymap(module.lmap)
  end
  -- 执行模块初始化方法
  if type(module.setup) == 'function' then
    local load_status = pcall(module.setup)
    -- 加载模块失败
    if not load_status then
      print('init module "' .. module.name .. '" error!')
    end
  end
end
-- 加载模块
function load_module(name)
  local status_ok, module = pcall(require, M.modules_path .. '.' .. name)
  if not status_ok then
    print('load module "' .. name .. '" error!')
    return
  end
  module.name = name
  init_module(module)
end
-- 批量加载模块
function M.load_modules(names)
  for i = 1, #names do
    local name = names[i]
    load_module(name)
  end
  packer.startup(function(use)
    for i, v in pairs(M.plugins) do
      use(v)
    end
  end)
  kb.setup()
end

return M

