---------- 主题等ui相关插件

local M = {
  plugins = {
    -- theme
    {"catppuccin/nvim", as = "catppuccin"},
    -- icons
    'kyazdani42/nvim-web-devicons',
    -- dashboard alpha
    'goolord/alpha-nvim',
    -- buffer line
    'akinsho/bufferline.nvim',
    -- lualine
    'nvim-lualine/lualine.nvim',
  }
}

M.lmap = {
  w = {
    name = 'Window',
    s = { '<cmd>Alpha<cr>', 'Startify window' },
  },
  b = {
    name = 'Buffer',
    o = { '<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>', 'Only current buffer' },
    c = {
      l = { '<cmd>BufferLineCloseLeft<cr>', 'Close left buffers' },
      r = { '<cmd>BufferLineCloseRight<cr>', 'Close right buffers' },
    },
  },
}

function M.setup()
  vim.cmd[[colorscheme catppuccin]]
  require('lualine').setup()
  require('bufferline').setup{}
  require('alpha').setup(require('alpha.themes.startify').config)
end

return M

