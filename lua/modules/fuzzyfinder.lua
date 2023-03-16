---------- 模糊查找

local M = {
  plugins = {
    -- fuzzy finder
    'nvim-telescope/telescope.nvim',
    {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  }
}

M.lmap = {
  w = {
    name = 'Window',
    s = { '<cmd>Alpha<cr>', 'Startify window' },
  },
  b = {
    name = 'Buffer',
    b = { '<cmd>Telescope buffers<cr>', 'Switch buffers' },
  },
  f = {
    name = 'File&Project',
    f = { '<cmd>Telescope find_files<cr>', 'Find File' },
    p = { '<cmd>Telescope projects<cr>', 'Find Project' },
    r = { '<cmd>Telescope oldfiles<cr>', 'Open Recent File' },
    s = { '<cmd>Telescope live_grep<cr>', 'Search string' },
  },
}

function M.setup()
  require('telescope').setup{
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      }
    }
  }
end

return M

