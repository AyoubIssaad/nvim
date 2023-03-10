-- lazy apparently requires leader key already set:
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install lazy automatically if not already installed on the system

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

local status, lazy = pcall(require, "lazy")
if not status then
	return
end

return lazy.setup({
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use
	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",
	-- "bluz71/vim-nightfly-guicolors",
	{ "bluz71/vim-nightfly-colors", name = "nightfly", lazy = true, priority = 1000 },
	-- "rebelot/kanagawa.nvim",
	-- tmux & split window navigation
	{ "christoomey/vim-tmux-navigator" },
	-- "szw/vim-maximizer", -- maximizes and restores current window
	-- Essential plugins
	{ "tpope/vim-surround", lazy = false }, -- add, delete, change surroundings (it's awesome)
	{ "numToStr/Comment.nvim", lazy = true },
	-- file explorer
	"nvim-tree/nvim-tree.lua",
	-- vs-code like icons
	"nvim-tree/nvim-web-devicons",
	-- statusline
	"nvim-lualine/lualine.nvim",
	-- fuzzy finding w/ telescope
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
	-- autocompletion
	"hrsh7th/nvim-cmp", -- completion plugin
	"hrsh7th/cmp-buffer", -- source for text in buffer
	"hrsh7th/cmp-path", -- source for file system paths

	-- snippets
	"L3MON4D3/LuaSnip", -- snippet engine
	"saadparwaiz1/cmp_luasnip", -- for autocompletion
	"rafamadriz/friendly-snippets", -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
	"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	"neovim/nvim-lspconfig", -- easily configure language servers
	"hrsh7th/cmp-nvim-lsp", -- for autocompletion
	{ "glepnir/lspsaga.nvim", branch = "main" }, -- enhanced lsp uis
	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion

	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

	-- better visual experience
	{ "lukas-reineke/indent-blankline.nvim" },

	-- treesitter configuration
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects", "windwp/nvim-ts-autotag" },
	},

	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...

	-- git integration
	"lewis6991/gitsigns.nvim", -- show line modifications on left hand side
	{ "j-hui/fidget.nvim" },
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	-- Lua
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	-- {
	-- 	"ThePrimeagen/refactoring.nvim",
	-- 	requires = {
	-- 		{ "nvim-lua/plenary.nvim" },
	-- 		{ "nvim-treesitter/nvim-treesitter" },
	-- 	},
	-- },
	{
		"goolord/alpha-nvim",
		enabled = false,
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	},
	{
		"phaazon/hop.nvim",
		enabled = false,
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},
	-- {
	-- 	"jinh0/eyeliner.nvim",
	-- 	config = function()
	-- 		require("eyeliner").setup({
	-- 			highlight_on_key = true, -- show highlights only after keypress
	-- 			dim = true, -- dim all other characters if set to true (recommended!)
	-- 		})
	-- 	end,
	-- },
	"unblevable/quick-scope",
}, {
	checker = { enabled = false },
	performance = {
		rtp = {
			disabled_plugins = {
				-- "matchit",
				-- "matchparen",
				-- "gzip",
				-- "netrwPlugin",
				-- "tarPlugin",
				-- "tohtml",
				-- "tutor",
				-- "zipPlugin",
			},
		},
	},
})
