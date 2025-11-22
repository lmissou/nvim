---------- Obsidian

local documents_dir = vim.fn.systemlist('xdg-user-dir DOCUMENTS')[1]
local home_dir = os.getenv('HOME')
if documents_dir == vim.NIL or documents_dir == home_dir then
  documents_dir = home_dir .. '/Documents'
end
local obsidian_path = documents_dir .. '/Notes'

local M = {
  "obsidian-nvim/obsidian.nvim",
  ft = "markdown",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    ui = {
      enable = true,
      checkboxes = {
        -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
        [" "] = { hl_group = "ObsidianTodo" },
        ["-"] = { hl_group = "ObsidianDoing" },
        ["x"] = { hl_group = "ObsidianDone" },
        ["~"] = { hl_group = "ObsidianCancel" },
        ["!"] = { hl_group = "ObsidianImportant" },
      }
    },
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
    { '<leader>on', mode = { 'n', 'v' }, '<cmd>ObsidianNew<cr>',            desc = 'Obsidian New' },
    { '<leader>or', mode = { 'n', 'v' }, '<cmd>ObsidianRename<cr>',         desc = 'Obsidian Rename' },
    { '<leader>og', mode = { 'n', 'v' }, '<cmd>ObsidianSearch<cr>',         desc = 'Obsidian Search' },
    { '<leader>ol', mode = { 'n', 'v' }, '<cmd>ObsidianLinks<cr>',          desc = 'Obsidian Links' },
    { '<leader>ob', mode = { 'n', 'v' }, '<cmd>ObsidianBacklinks<cr>',      desc = 'Obsidian Backlinks' },
    { '<leader>oo', mode = { 'n', 'v' }, '<cmd>ObsidianToday<cr>',          desc = 'Obsidian Today' },
    { '<leader>od', mode = { 'n', 'v' }, '<cmd>ObsidianDailies<cr>',        desc = 'Obsidian Deilies' },
    { '<leader>oc', mode = { 'n', 'v' }, '<cmd>ObsidianToggleCheckbox<cr>', desc = 'Obsidian Toggle Checkbox' },
  }
}
-- return M
return {}
