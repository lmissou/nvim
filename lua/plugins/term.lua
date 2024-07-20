---------- terminal

local M = {
  -- terminal
  "akinsho/toggleterm.nvim",
  config = function()
    -- use powershell(on windows)
    if vim.fn.has("win32") then
      local powershell_options = {
        shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
        shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
        shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
        shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
        shellquote = "",
        shellxquote = "",
      }
      for option, value in pairs(powershell_options) do
        vim.opt[option] = value
      end
    end

    -- setup toggleterm
    require("toggleterm").setup({
      direction = "float",
    })

    -- keybinding
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
