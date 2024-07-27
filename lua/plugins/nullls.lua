---------- null-ls (lsp linter and formater)

local M = {
  -- null-ls (linter)
  'nvimtools/none-ls.nvim',
  dependencies = {
    {
      'jay-babu/mason-null-ls.nvim',
      opts = {
        automatic_setup = true,
        handlers = {
          function(source_name, methods)
            require('mason-null-ls').default_setup(source_name, methods)
          end,
        },
      },
    },
  },
  opts = {},
}

return M
