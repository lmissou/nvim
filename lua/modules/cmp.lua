---------- 补全

local M = {
  plugins = {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    -- cmp for neovim lua api
    'hrsh7th/cmp-nvim-lua',
    -- lsp config
    'neovim/nvim-lspconfig',
    -- lsp saga (ui)
    'tami5/lspsaga.nvim',
    -- null-ls (linter)
    'Carlosiano/null-ls.nvim',
    -- lsp icon
    'onsails/lspkind-nvim',
    -- snippets
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    'saadparwaiz1/cmp_luasnip',
  }
}

function M.setup()
  local cmp = require('cmp')
  local lspkind = require('lspkind')
  local luasnip = require('luasnip')
  require('luasnip.loaders.from_vscode').lazy_load({
    paths = {
      vim.fn.stdpath('data') .. '/site/pack/packer/start/friendly-snippets',
      vim.fn.stdpath('config') .. '/snippets',
    }
  })

  local cmp_tab_func = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.in_snippet() and luasnip.jumpable(1) then
      luasnip.jump(1)
    elseif luasnip.expandable() then
      luasnip.expand()
    else
      fallback()
    end
  end, {
    'i',
    's',
  })
  local cmp_stab_func = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.in_snippet() and luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, {
    'i',
    's',
  })

  cmp.setup({
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    formatting = {
      format = lspkind.cmp_format({
        with_text = false, -- do not show text alongside icons
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        before = function (entry, vim_item)
          vim_item.menu = ({
            nvim_lsp = '[LSP]',
            nvim_lua = '[LUA]',
            buffer = '[BUF]',
            luasnip = '[SNIP]',
            path = '[PATH]',
            cmdline = '[CMD]',
          })[entry.source.name]
          return vim_item
        end
      })
    },
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<Tab>'] = cmp_tab_func,
      ['<S-Tab>'] = cmp_stab_func,
      ['<C-n>'] = cmp_tab_func,
      ['<C-p>'] = cmp_stab_func,
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' }, -- For luasnip users.
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- lsp config
  -- lsp saga
  require'lspsaga'.init_lsp_saga()
  local null_ls = require('null-ls')
  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.diagnostics.eslint_d,
    },
  })

end

return M

