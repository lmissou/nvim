---------- terminal

local M = {
  -- terminal
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      direction = "float",
    })
    local kb = require("config.keybindings")
    kb.add_prefix("t", "Terminal")
    kb.bind_leader("tt", "<cmd>ToggleTerm<cr>", "Open term")
    for i = 1, 9, 1 do
      kb.bind_leader("t" .. i, "<cmd>ToggleTerm " .. i .. "<cr>", "Open term " .. i)
    end
    function _G.set_terminal_keymaps()
      local opts = { noremap = true }
      vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts) -- hidden term
    end
    -- only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd([[autocmd! TermOpen term://* lua set_terminal_keymaps()]])
  end,
}

return M
