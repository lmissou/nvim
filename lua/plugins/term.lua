local kb = require "config.keybindings"
---------- terminal

local terms = {}
local set_keymap = function(bufnr)
  local modes = { "t", "n" }
  function kill()
    vim.uv.kill(terms[bufnr], "sigkill")
    table.remove(terms, bufnr)
    vim.api.nvim_buf_delete(bufnr, {
      force = true,
    })
  end

  for _, mode in ipairs(modes) do
    vim.api.nvim_buf_set_keymap(bufnr, mode, "<C-t>", "Open New Terminal", {
      callback = function()
        require("terminal").open()
      end,
    })

    vim.api.nvim_buf_set_keymap(bufnr, mode, "<C-q>", "Quit Terminal", {
      callback = kill,
    })
    vim.api.nvim_buf_set_keymap(bufnr, mode, "<leader>bd", "Close Terminal", {
      callback = kill,
    })

    vim.api.nvim_buf_set_keymap(bufnr, mode, "<esc>", "Stop Terminal Insert", {
      callback = function()
        vim.cmd("stopinsert")
      end,
    })
  end
end

local M = {
  -- terminal
  'niuiic/terminal.nvim',
  opts = {
    on_term_opened = function(bufnr, pid)
      vim.api.nvim_set_option_value("filetype", "terminal", {
        buf = bufnr,
      })
      set_keymap(bufnr)
      terms[bufnr] = pid
    end,
  },
  keys = {
    {
      "<leader>tt",
      function()
        require("terminal").open()
      end,
      desc = "open terminal",
    },
  },
}

kb.bind_key('t', '<C-h>', 'bd', 'Close terminal')

return M
