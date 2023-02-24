-- 显示行号
vim.o.number = true
vim.cmd[[
augroup relative_numbser
  autocmd!
  autocmd InsertEnter * :set norelativenumber
  autocmd InsertLeave * :set relativenumber
augroup END
]]
-- 缓冲区未保存时也可以切换到后台
vim.o.hidden = true
-- 设置utf8编码
vim.o.encoding = 'UTF-8'
-- 开启鼠标
vim.o.mouse = 'a'
-- 设置4空格缩进
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
-- 平滑滚动
vim.o.scrolloff = 5
-- 设置空白字符的视觉提示
vim.o.list = true
vim.o.listchars = 'extends:❯,precedes:❮,tab:▸-,trail:˽'
-- 高亮当前行和当前列
vim.o.cursorline = true
vim.o.cursorcolumn = true
-- 不生成备份文件
vim.o.backup = false
vim.o.writebackup = false
-- 查找时忽略大小写
vim.o.ic = true
vim.o.shortmess = vim.o.shortmess..'c'
-- 左侧行号和错误提示共用
vim.o.signcolumn = 'yes'
-- 设置主题
vim.o.termguicolors = true
vim.cmd[[colorscheme catppuccin]]
require'lualine'.setup()
require'bufferline'.setup{}
require'nvim-tree'.setup{
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
}
vim.g.nvim_tree_respect_buf_cwd = 1
require'alpha'.setup(require('alpha.themes.startify').config)
