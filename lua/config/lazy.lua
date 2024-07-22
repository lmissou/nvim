---------- 加载lazy.nvim

local M = {}

function M.setup()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
  local lazy_spec = { import = "plugins" }
  if vim.g.vscode then
    lazy_spec = {
      { import = "plugins.basic" },
      { import = "plugins.motion" },
    }
  end
  require("lazy").setup({
    spec = lazy_spec,
    defaults = {
      event = "VeryLazy",
    },
    performance = {
      rtp = {
        -- disable some rtp plugins
        disabled_plugins = {
          "gzip",
          "netrwPlugin",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        },
      },
    },
  })
end

return M
