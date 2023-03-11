---------- 主题等ui相关插件

local M = {
  plugins = {
    -- themes
    'loctvl842/monokai-pro.nvim',
    'shaunsingh/nord.nvim',
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
  require('lualine').setup()
  require('bufferline').setup{}
  require('alpha').setup(require('alpha.themes.startify').config)
  require("monokai-pro").setup({
    filter = 'octagon'
  })
  vim.cmd[[colorscheme monokai-pro]]
end

return M

