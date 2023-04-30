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

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
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

	'tpope/vim-fugitive',
  'tpope/vim-surround',
  'tpope/vim-repeat',

  'nvim-tree/nvim-tree.lua',

  -- { 'windwp/nvim-autopairs', build = function() require("nvim-autopairs").setup {} end, },
  'jiangmiao/auto-pairs',

  -- 'scrooloose/nerdcommenter',
  'numToStr/Comment.nvim',
  'jpalardy/vim-slime',
  'kshenoy/vim-signature',
  'djoshea/vim-autoread',
  'Yggdroot/indentLine',

  -- tmux
  'aserowy/tmux.nvim',

	-- colorscheme
	'rmehri01/onenord.nvim',
}

local opts = {}

require("lazy").setup(plugins, opts)
