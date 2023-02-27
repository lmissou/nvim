---------- file tree

local M = {
  plugins = {
    -- file tree
    'kyazdani42/nvim-tree.lua',
  }
}

M.lmap = {
  f = {
    name = 'File',
    t = { '<cmd>NvimTreeToggle<cr>', 'Open File Tree' },
  },
}

function M.setup()
  require('nvim-tree').setup{
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true
    },
  }
  vim.g.nvim_tree_respect_buf_cwd = 1
end

return M

