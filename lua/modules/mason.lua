---------- mason(lsp,dap,linter...的安装工具)

local M = {
  plugins = {
    -- null-ls (linter)
    'Carlosiano/null-ls.nvim',
    -- dap
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'jay-babu/mason-nvim-dap.nvim',
    -- mason
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'jay-babu/mason-null-ls.nvim',
  }
}

M.nmap = {
  {'<F5>', '<cmd>DapContinue<cr>'},
  {'<F10>', '<cmd>DapTerminate<cr>'},
  {'<F9>', '<cmd>DapToggleBreakpoint<cr>'},
  {'<F6>', '<cmd>DapStepOver<cr>'},
  {'<F7>', '<cmd>DapStepInto<cr>'},
  {'<F8>', '<cmd>DapStepOut<cr>'},
}

function M.setup()
  local mason = require('mason')
  local mason_lspconfig = require('mason-lspconfig')
  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true }
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
    vim.api.nvim_set_keymap('n', '[d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
    vim.api.nvim_set_keymap('n', ']d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
    -- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>Lspsaga preview_definition<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>Lspsaga hover_doc<CR>',opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>Lspsaga signature_help<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', '<cmd>Lspsaga rename<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', '<cmd>Lspsaga code_action<CR>', opts)
  end

  mason.setup({})
  -- Setup mason-lspconfig.
  mason_lspconfig.setup({})
  mason_lspconfig.setup_handlers({
    function(server_name)
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
      require("lspconfig")[server_name].setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
    end
  })
  local null_ls = require('null-ls')
  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.eslint_d,
    },
  })
  require('mason-null-ls').setup({
    automatic_setup = true,
  })
  require('mason-null-ls').setup_handlers {
    function(source_name, methods)
      require('mason-null-ls.automatic_setup')(source_name, methods)
    end
  }
  local dap, dapui = require("dap"), require("dapui")
  -- 
  dapui.setup({
    icons = {
      expanded = "",
      collapsed = "",
      current_frame = ""
    },
    controls = {
      icons = {
        pause = "",
        play = "",
        step_into = "",
        step_over = "",
        step_out = "",
        step_back = "",
        run_last = "",
        terminate = "",
        disconnect = "",
      }
    }
  })
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
  local mason_dap = require('mason-nvim-dap')
  mason_dap.setup({
    automatic_setup = true,
  })
  mason_dap.setup_handlers({
    function(source_name)
      require('mason-nvim-dap.automatic_setup')(source_name)
    end,
  })
  local dap_breakpoint = {
    error = {
      text = "",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    },
    rejected = {
      text = "",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl = "",
    },
    stopped = {
      text = "",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    },
  }
  vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
  vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
  vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

return M

