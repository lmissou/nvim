---------- file tree

local function on_tree_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', '<C-[>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', 'gc', function()
    vim.ui.input({
      prompt = 'Enter path',
      completion = 'file',
      default = './',
    }, function(dir)
      if dir == nil then
        return
      end
      if dir == './' then
        dir = vim.fn.getcwd()
      end
      api.tree.change_root(dir)
    end)
  end, opts('Change current dir'))
end

local M = {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    sort = {
      sorter = 'case_sensitive',
    },
    view = {
      width = 40,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
    on_attach = on_tree_attach,
  },
  keys = {
    { '<leader>f', desc = 'File' },
    {
      '<leader>ft',
      mode = { 'n', 'v' },
      function() require('nvim-tree.api').tree.toggle() end,
      desc = 'File Tree Toggle'
    },
    {
      '<leader>fT',
      mode = { 'n', 'v' },
      function()
        local api = require('nvim-tree.api')
        vim.ui.input({
          prompt = 'Enter path',
          completion = 'file',
          default = './',
        }, function(dir)
          if dir == nil then
            return
          end
          if dir == './' then
            dir = vim.fn.getcwd()
          end
          vim.fn.chdir(dir)
          api.tree.open(dir)
        end)
      end,
      desc = 'File Tree Open(input path)'
    },
  },
}

return M
