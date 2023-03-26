---------- neovim默认配置修改优化

local M = {}

local defaults = {
  -- 显示行号
  number = true,
  -- 缓冲区未保存时也可以切换到后台
  hidden = true,
  -- 设置utf8编码
  encoding = "UTF-8",
  -- 开启鼠标
  mouse = "a",
  -- 设置2空格缩进
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  -- 平滑滚动
  scrolloff = 5,
  -- 设置空白字符的视觉提示
  list = true,
  listchars = "extends:❯,precedes:❮,tab:▸-,trail:˽",
  -- 高亮当前行和当前列
  cursorline = true,
  cursorcolumn = true,
  -- 不生成备份文件
  backup = false,
  writebackup = false,
  -- 搜索时忽略大小写
  ic = true,
  shortmess = vim.o.shortmess .. "c",
  -- 左侧行号和错误提示共用
  signcolumn = "yes",
  -- 设置主题
  termguicolors = true,
}

local options

function M.setup(opts)
  options = vim.tbl_deep_extend("force", defaults, opts or {})
  for k, v in pairs(options) do
    vim.o[k] = v
  end
  -- 查看时使用相对行号，编辑时使用绝对行号
  local relative_numbser = vim.api.nvim_create_augroup("relative_numbser", { clear = true })
  vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    pattern = "*",
    group = relative_numbser,
    callback = function()
      vim.o.relativenumber = false
    end,
  })

  vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    pattern = "*",
    group = relative_numbser,
    callback = function()
      vim.o.relativenumber = true
    end,
  })
end

return M
