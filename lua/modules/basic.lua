---------- 基础配置相关插件

local M = {
  plugins = {
    -- lua tool functions
    'nvim-lua/plenary.nvim',
    -- root权限读写文件
    'lambdalisue/suda.vim',
    -- multi cursors edit
    'mg979/vim-visual-multi',
    -- surround
    'kylechui/nvim-surround',
    -- 缩进线
    'lukas-reineke/indent-blankline.nvim',
  }
}

M.lmap = {
  w = {
    name = 'Window',
    o = { '<cmd>only<cr>', 'Only current window' },
    h = { '<cmd>vsplit<cr>', 'VSplit window' },
    v = { '<cmd>split<cr>', 'Split window' },
  },
  b = {
    name = 'Buffer',
    d = { '<cmd>bdelete<cr>', 'Delete buffers' },
    n = { '<cmd>bnext<cr>', 'Next buffer' },
    p = { '<cmd>bprevious<cr>', 'Previous buffer' },
  },
}

function M.setup()
  require'nvim-surround'.setup({})
  require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    -- show_current_context = true,
    -- show_current_context_start = true,
  }
end

return M

