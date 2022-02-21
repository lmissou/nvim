vim.cmd [[packadd packer.nvim]]

return require'packer'.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- lua tool functions
  use 'nvim-lua/plenary.nvim'
  -- theme
  use {"catppuccin/nvim", as = "catppuccin"}
  -- icon
  use 'kyazdani42/nvim-web-devicons'
  -- Auto Compelet
  use {'hrsh7th/nvim-cmp', requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    -- cmp for neovim lua api
    'hrsh7th/cmp-nvim-lua',
    -- lsp config
    'neovim/nvim-lspconfig',
    -- lsp saga (ui)
    'glepnir/lspsaga.nvim',
    -- lsp installer
    'williamboman/nvim-lsp-installer',
    -- lsp icon
    'onsails/lspkind-nvim',
    -- snippets
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    'saadparwaiz1/cmp_luasnip',
  }}
  -- sudo write/read file
  use 'lambdalisue/suda.vim'
  -- which Key
  use 'folke/which-key.nvim'
  -- dashboard alpha
  use 'goolord/alpha-nvim'
  -- buffer line
  use 'akinsho/bufferline.nvim'
  -- lualine
  use 'nvim-lualine/lualine.nvim'
  -- file tree
  use 'kyazdani42/nvim-tree.lua'
  -- markdown preview
  use 'iamcco/markdown-preview.nvim'
  -- surround
  use 'blackCauldron7/surround.nvim'
  -- comment
  use 'numToStr/Comment.nvim'
  -- auto pairs
  use 'steelsojka/pears.nvim'
  -- editorconfig
  use 'editorconfig/editorconfig-vim'
  -- project (change pwd)
  use 'ahmedkhalf/project.nvim'
  -- fuzzy finder
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- hop(easy motion)
  use 'phaazon/hop.nvim'
  -- multi cursors edit
  use 'mg979/vim-visual-multi'
  -- terminal
  use 'akinsho/toggleterm.nvim'
  -- git
  use 'lewis6991/gitsigns.nvim'
end)

