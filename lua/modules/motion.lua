---------- 快速移动光标

local M = {
  plugins = {
    'ggandor/leap.nvim',
    'ggandor/flit.nvim',
  }
}

function M.setup()
  require('leap').add_default_mappings()
  require('flit').setup {
    keys = { f = 'f', F = 'F', t = 't', T = 'T' },
    -- A string like "nv", "nvo", "o", etc.
    labeled_modes = "v",
    multiline = true,
    -- Like `leap`s similar argument (call-specific overrides).
    -- E.g.: opts = { equivalence_classes = {} }
    opts = {}
  }
end

return M

