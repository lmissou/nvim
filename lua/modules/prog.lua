---------- 基础配置相关插件

local M = {
  plugins = {
    -- comment
    'numToStr/Comment.nvim',
    -- auto pairs
    'windwp/nvim-autopairs',
    -- RGB颜色代码显示
    'norcalli/nvim-colorizer.lua',
    -- autotag
    'windwp/nvim-ts-autotag',
    -- editorconfig
    'editorconfig/editorconfig-vim',
    -- project (change pwd)
    'ahmedkhalf/project.nvim',
    -- markdown preview
    'iamcco/markdown-preview.nvim',
  }
}

function M.setup()
  -- comment
  require('Comment').setup{}
  -- auto pairs
  require('nvim-autopairs').setup()
  -- colorizer
  require('colorizer').setup()
  -- auto close and auto rename html tag
  require('nvim-ts-autotag').setup()
  -- project
  require('project_nvim').setup{}
  local status_ok, telescope = pcall(require, 'telescope')
  if status_ok then
    telescope.load_extension('projects')
  end
end

return M

