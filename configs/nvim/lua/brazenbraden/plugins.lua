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
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
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
      { 'neovim/nvim-lspconfig' },
      {
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    }
  },

  -- Ruby / RoR
  'vim-ruby/vim-ruby',
  'tpope/vim-rails',
  'RRethy/nvim-treesitter-endwise', -- auto end code blocks
  'jgdavey/vim-blockle',            -- swap between do and {} blocks
  'thoughtbot/vim-rspec',
  'tpope/vim-dispatch',             -- spec runner

  -- AI
  'github/copilot.vim',
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken" -- linux only
  },
  'robitx/gp.nvim',

  -- Git
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
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

  'nvim-lualine/lualine.nvim',

  'tpope/vim-surround',          -- easy manipulation of surrounding pairs
  'tpope/vim-repeat',            -- more power to the . operator

  'nvim-tree/nvim-tree.lua',     -- file explorer
  'nvim-tree/nvim-web-devicons', -- pretty web icon pack

  'windwp/nvim-autopairs',       -- auto-closing syntax pairs
  'ggandor/leap.nvim',           -- quickly hop around
  'numToStr/Comment.nvim',       -- code commenter
  'jpalardy/vim-slime',          -- vim to tmux
  'kshenoy/vim-signature',       -- show marks in sidebar
  'djoshea/vim-autoread',        -- reload buffers on file changes
  'Yggdroot/indentLine',         -- display lines on tab indents

  'aserowy/tmux.nvim',           -- simple navigation between vim and tmux

  -- snippets
  {
    'L3MON4D3/LuaSnip',
    build = "make install_jsregexp"
  },
  'saadparwaiz1/cmp_luasnip',

  -- colorscheme
  'folke/tokyonight.nvim',

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  }
}

local opts = {}

require("lazy").setup(plugins, opts)
