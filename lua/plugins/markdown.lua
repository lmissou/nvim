---------- Markdown

local M = {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  ft = { "markdown", "vimwiki", "Avante", "AvanteInput", "copilot-chat", "codecompanion" },
  ---@module "render-markdown"
  ---@type render.md.UserConfig
  opts = {
    file_types = { "markdown", "vimwiki", "Avante", "AvanteInput", "copilot-chat", "codecompanion", },
    checkbox = {
      enabled = true,
      unchecked = { icon = '󰄱 ' },
      checked = { icon = '󰱒 ' },
      custom = {
        todo = { raw = '[ ]', rendered = '󰄱 ' },
        doing = { raw = '[-]', rendered = "󰜴 " },
        done = { raw = '[x]', rendered = '󰱒 ' },
        cancel = { raw = '[~]', rendered = "󰜺 " },
        important = { raw = '[!]', rendered = " " },
      },
    },
  },
}

return M
