---------- terminal

local M = {
  plugins = {
    -- terminal
    'akinsho/toggleterm.nvim',
  }
}

M.lmap = {
  t = {
    name = 'Terminal',
    t = { '<cmd>ToggleTerm<cr>', 'Open terminal' },
  },
}
for i = 1, 9, 1 do
  M.lmap.t[tostring(i)] = { '<cmd>ToggleTerm '..i..'<cr>', 'Open terminal '..i }
end

function M.setup()
  require('toggleterm').setup{
    direction = 'float',
  }
  function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts) -- hidden term
  end
  -- only want these mappings for toggle term use term://*toggleterm#* instead
  vim.cmd[[autocmd! TermOpen term://* lua set_terminal_keymaps()]]
end

return M

