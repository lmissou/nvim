---------- dap(debug adapter)

local M = {
  -- dap
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
    'jay-babu/mason-nvim-dap.nvim',
  },
  -- some icons: 
  config = function()
    local dap, dapui = require('dap'), require('dapui')
    dapui.setup({
      icons = {
        expanded = '',
        collapsed = '',
        current_frame = '',
      },
      controls = {
        icons = {
          pause = '',
          play = '',
          step_into = '',
          step_over = '',
          step_out = '',
          step_back = '',
          run_last = '',
          terminate = '',
          disconnect = '',
        },
      },
    })
    -- dap-ui config
    local dap_breakpoint = {
      error = {
        text = '',
        texthl = 'LspDiagnosticsSignError',
        linehl = '',
        numhl = '',
      },
      rejected = {
        text = '',
        texthl = 'LspDiagnosticsSignHint',
        linehl = '',
        numhl = '',
      },
      stopped = {
        text = '',
        texthl = 'LspDiagnosticsSignInformation',
        linehl = 'DiagnosticUnderlineInfo',
        numhl = 'LspDiagnosticsSignInformation',
      },
    }
    vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
    vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)
    vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end

    local mason_dap = require('mason-nvim-dap')
    mason_dap.setup({
      automatic_setup = true,
      handlers = {
        function(config)
          -- all sources with no handler get passed here
          -- Keep original functionality
          mason_dap.default_setup(config)
        end,
      },
    })
    local kb = require('config.keybindings')
    kb.bind_key('n', '<F5>', '<cmd>DapContinue<cr>')
    kb.bind_key('n', '<F10>', '<cmd>DapTerminate<cr>')
    kb.bind_key('n', '<F9>', '<cmd>DapToggleBreakpoint<cr>')
    kb.bind_key('n', '<F6>', '<cmd>DapStepOver<cr>')
    kb.bind_key('n', '<F7>', '<cmd>DapStepInto<cr>')
    kb.bind_key('n', '<F8>', '<cmd>DapStepOut<cr>')
    kb.add_prefix('d', 'Debug')
    kb.bind_leader('dc', '<cmd>DapContinue<cr>', 'Continue')
    kb.bind_leader('dq', '<cmd>DapTerminate<cr>', 'Terminate')
    kb.bind_leader('dt', '<cmd>DapToggleBreakpoint<cr>', 'Toggle Breakpoint')
    kb.bind_leader('ds', '<cmd>DapStepOver<cr>', 'Step Over')
    kb.bind_leader('di', '<cmd>DapStepInto<cr>', 'Step Into')
    kb.bind_leader('do', '<cmd>DapStepOut<cr>', 'Setp Out')
  end,
}

return M
