---------- 基础配置相关插件

local M = {
  plugins = {
    -- lua tool functions
    'nvim-lua/plenary.nvim',
    -- root权限读写文件
    'lambdalisue/suda.vim',
    -- multi cursors edit
    'mg979/vim-visual-multi',
    -- 多行缩进
    'joshnavdev/indentation-multiline.nvim',
    -- surround
    'kylechui/nvim-surround',
    -- 缩进线
    'lukas-reineke/indent-blankline.nvim',

    'kevinhwang91/promise-async',
    -- 折叠优化
    'kevinhwang91/nvim-ufo',
    -- 区域移动文本
    'booperlv/nvim-gomove',
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
  require('indentation-multiline').setup({
    -- Mapping for right-intent
    indent_mapping = ">",
    -- Mapping for left-intent
    unindent_mapping = "<",
  })
  require'nvim-surround'.setup({})
  require("indent_blankline").setup({})
  -- 折叠优化
  require('ufo').setup({
    fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
      -- 自定义显示文字
      local newVirtText = {}
      local suffix = ('...  %d'):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, { suffix, 'MoreMsg' })
      return newVirtText
    end
  })
  require('gomove').setup()
end

return M

