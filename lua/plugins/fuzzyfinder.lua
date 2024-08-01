---------- 模糊查找

local M = {
  {
    -- fuzzy finder
    'nvim-telescope/telescope.nvim',
    keys = {
      { '<leader>b', desc = 'Buffer' },
      { '<leader>bb', mode = { 'n', 'v' }, '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
      { '<leader>f', desc = 'File' },
      { '<leader>ff', mode = { 'n', 'v' }, '<cmd>Telescope find_files<cr>', desc = 'Find File' },
      { '<C-p>', mode = { 'n', 'v' }, '<cmd>Telescope find_files<cr>', desc = 'Find File' },
      { '<leader>fr', mode = { 'n', 'v' }, '<cmd>Telescope oldfiles<cr>', desc = 'Open Recent File' },
      { '<leader>fs', mode = { 'n', 'v' }, '<cmd>Telescope live_grep<cr>', desc = 'Search string' },
      {
        '<leader>fc',
        mode = { 'n', 'v' },
        function()
          vim.ui.input({
            prompt = 'Enter path',
            completion = 'file',
            default = '.',
          }, function(dir)
            if dir == nil then
              return
            end
            if dir == '.' then
              -- 获取当前文件路径
              dir = vim.fn.expand('%:h')
            end
            vim.api.nvim_set_current_dir(dir)
          end)
        end,
        desc = 'Ch pwd to current buffer',
      },
    },
    config = function()
      require('telescope').setup({
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
          },
        },
      })
    end,
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>f', desc = 'File' },
      { '<leader>fb', mode = { 'n', 'v' }, '<cmd>Telescope file_browser<cr>', desc = 'File Browser' },
    },
    config = function()
      require('telescope').load_extension('file_browser')
    end,
  },
}

return M
