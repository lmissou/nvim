local lazy = require('config.lazy')
local opt = require('config.options')
local kb = require('config.keybindings')

local M = {}

function M.setup(opts)
  opt.setup(opts.options)
  lazy.setup()
  kb.setup()
end

return M
