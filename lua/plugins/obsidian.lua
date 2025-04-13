---------- Obsidian

local obsidian_path = vim.fn.getenv("OBSIDIAN_NOTE_PATH")
if obsidian_path == vim.NIL then
  obsidian_path = "~/文档/Obsidian"
end

local M = {
  "epwalsh/obsidian.nvim",
  ft = "markdown",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Obsidian",
        path = obsidian_path,
      },
    },
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "dailies",
    },
    note_id_func = function(title)
      return title
    end,
    attachments = {
      -- The default folder to place images in via `:ObsidianPasteImg`.
      img_folder = "assets",
    }
  },
  keys = {
    { '<leader>o',  desc = 'Obsidian' },
    { '<leader>oc', mode = { 'n', 'v' }, '<cmd>ObsidianNew<cr>',       desc = 'Obsidian New' },
    { '<leader>or', mode = { 'n', 'v' }, '<cmd>ObsidianRename<cr>',    desc = 'Obsidian Rename' },
    { '<leader>og', mode = { 'n', 'v' }, '<cmd>ObsidianSearch<cr>',    desc = 'Obsidian Search' },
    { '<leader>oo', mode = { 'n', 'v' }, '<cmd>ObsidianToday<cr>',     desc = 'Obsidian Today' },
    { '<leader>od', mode = { 'n', 'v' }, '<cmd>ObsidianDailies<cr>',   desc = 'Obsidian Deilies' },
    { '<leader>ol', mode = { 'n', 'v' }, '<cmd>ObsidianLinks<cr>',     desc = 'Obsidian Links' },
    { '<leader>ob', mode = { 'n', 'v' }, '<cmd>ObsidianBacklinks<cr>', desc = 'Obsidian Backlinks' },
  }
}
return M
