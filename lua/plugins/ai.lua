---------- AI

local M = {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    interactions = {
      cli = {
        agent = "claude_code",
        agents = {
          claude_code = {
            cmd = "claude",
            args = {},
            description = "Claude Code CLI",
            provider = "terminal",
          },
        },
      },
      chat = {
        -- You can specify an adapter by name and model (both ACP and HTTP)
        adapter = {
          name = "claude_code",
          model = "gemma4",
        },
      },
      -- Or, just specify the adapter by name
      inline = {
        -- adapter = "anthropic",
        adapter = "claude_code",
      },
      cmd = {
        adapter = "claude_code",
      },
      background = {
        adapter = {
          name = "ollama",
          model = "gemma4",
        },
      },
    },
    -- NOTE: The log_level is in `opts.opts`
    opts = {
      log_level = "DEBUG", -- or "TRACE"
    },
  },
}

return M
