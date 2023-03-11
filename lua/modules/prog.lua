
---------- 基础配置相关插件

local M = {
  plugins = {
    -- comment
    'numToStr/Comment.nvim',
    -- auto pairs
    'steelsojka/pears.nvim',
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
  require('pears').setup()
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

