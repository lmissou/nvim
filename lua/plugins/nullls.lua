---------- null-ls (lsp linter and formater)

local M = {
  -- null-ls (linter)
  "nvimtools/none-ls.nvim",
  dependencies = {
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    require("null-ls").setup({})
    require("mason-null-ls").setup({
      automatic_setup = true,
      handlers = {
        function(source_name, methods)
          require("mason-null-ls").default_setup(source_name, methods)
        end,
      },
    })
  end,
}

return M
