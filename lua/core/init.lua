local opt = require('core.options')
local modules = require('core.modules')

local M = {}

function M.setup(options)
  modules.load_modules(options.modules)
  opt.setup(options.options)
end

return M

