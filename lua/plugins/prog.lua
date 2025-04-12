---------- 基础配置相关插件

local M = {
  -- comment
  {
    'numToStr/Comment.nvim',
    dependencies = 'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end,
  },
  -- auto pairs
  {
    'windwp/nvim-autopairs',
    opts = {},
  },
  -- 缩进线
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
  -- RGB颜色代码显示
  {
    'norcalli/nvim-colorizer.lua',
    opts = { '*' },
  },
  -- editorconfig
  {
    'editorconfig/editorconfig-vim',
  },
  -- markdown preview
  {
    'iamcco/markdown-preview.nvim',
  },
}

return M
