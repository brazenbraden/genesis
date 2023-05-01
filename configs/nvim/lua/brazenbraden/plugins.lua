local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects TODO: Check this out

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  },

  -- Ruby / RoR
  'vim-ruby/vim-ruby',
  'tpope/vim-rails',
  'RRethy/nvim-treesitter-endwise',
  'jgdavey/vim-blockle',
  'thoughtbot/vim-rspec',
  'tpope/vim-dispatch', -- spec runner

  -- Git
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  { -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  { -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  'tpope/vim-surround',
  'tpope/vim-repeat',

  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',

  'windwp/nvim-autopairs',

  'numToStr/Comment.nvim',
  'jpalardy/vim-slime', -- vim to tmux
  'kshenoy/vim-signature',
  'djoshea/vim-autoread',
  'Yggdroot/indentLine',

  'aserowy/tmux.nvim',

  -- snippets
  'dcampos/nvim-snippy',
  'dcampos/cmp-snippy',

  -- colorscheme
  'rmehri01/onenord.nvim',
}

local opts = {}

require("lazy").setup(plugins, opts)
