---------- 基础配置相关插件

local M = {
  -- root权限读写文件
  {
    "lambdalisue/suda.vim",
  },
  -- multi cursors edit
  {
    "mg979/vim-visual-multi",
  },
  -- 多行缩进
  {
    "joshnavdev/indentation-multiline.nvim",
    config = function()
      require("indentation-multiline").setup({
        -- Mapping for right-intent
        indent_mapping = ">",
        -- Mapping for left-intent
        unindent_mapping = "<",
      })
    end,
  },
  -- surround
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  -- 缩进线
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup({})
    end,
  },
  -- 区域移动文本 Alt + h/j/k/l
  {
    "booperlv/nvim-gomove",
    config = function()
      require("gomove").setup({})
    end,
  },
}

return M
