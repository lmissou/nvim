---------- 基础配置相关插件

local M = {
  -- comment
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({})
    end,
  },
  -- auto pairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  -- RGB颜色代码显示
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  -- autotag
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- editorconfig
  {
    "editorconfig/editorconfig-vim",
  },
  -- project (change pwd)
  {
    "ahmedkhalf/project.nvim",
    keys = { "<leader>fp" },
    config = function()
      require("project_nvim").setup({})
      local status_ok, telescope = pcall(require, "telescope")
      if status_ok then
        telescope.load_extension("projects")
      end
    end,
  },
  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
  },
}

return M
