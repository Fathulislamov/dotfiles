local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" if not vim.loop.fs_stat(lazypath) then vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require('Theme'), -- Colorscheme
	require('Noice'), -- Completely replaces the UI
	require('Telescope-file-browser'),
	require('ChatGPT'),
	require('Which-key'),
	require('Auto-save'), -- Auto save
	require('Lualine'),   -- Status bar
	require('Neoscroll'), -- Smooth scroll
	require('Toggleterm'), -- Terminal
	require('Pantran'),   -- Translate
	require('Hop'),       -- Motion
	require('Treesitter'), -- Motion
	--	require('Hydra'),                     -- Custom mode
	require('Colorizer'), -- Highlighting color
	require('Autoclose'), -- Autopair
	require('telescope/Telescope'),                                                                               -- Autopair
	--	{ 'nvim-telescope/telescope.nvim',    branch = '0.1.x', },                                          -- Fuzzy finder
	{ 'yutkat/confirm-quit.nvim',         event = "CmdlineEnter",                           opts = {} }, -- Smart quit
	--	{ 'numToStr/Comment.nvim',           opts = {},              lazy = false, }, -- Comment
	--	{ 'AckslD/nvim-neoclip.lua' },
	--	{
	--		'olrtg/nvim-emmet',
	--		config = function()
	--			vim.keymap.set({ "n", "v" }, '<leader>xe',
	--				require('nvim-emmet').wrap_with_abbreviation)
	--		end
	--	},
	--	require('plugin-lazygit'),
	--	{ 'mlaursen/vim-react-snippets' },
	--	{ 'r5n-dev/vscode-react-javascript-snippets' },
	--	{
	--		{
	--			"benfowler/telescope-luasnip.nvim",
	--			module = "telescope._extensions.luasnip", -- if you wish to lazy-load
	--		}
	--	},
	--	{
	--		'stevearc/conform.nvim',
	--		opts = {},
	--	},
	--	{ 'styled-components/vim-styled-components' },
	--	{ 'nvim-lua/popup.nvim' },
	--	{ 'crwebb85/telescope-media-files.nvim' },

	--	{
	--		"robitx/gp.nvim",
	--		config = function()
	--			require("gp").setup()

	-- or setup with your own config (see Install > Configuration in Readme)
	-- require("gp").setup(config)

	-- shortcuts might be setup here (see Usage > Shortcuts in Readme)
	--		end,
	--	},
	--	-- LSP
	{ 'neovim/nvim-lspconfig' }, -- LSP config
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'nvim-lua/lsp-status.nvim' }, -- Get stat us LSP
	--	{
	--		'pmizio/typescript-tools.nvim',
	--		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	--		opts = {},
	--	},
	-- Autocompletion
	{ 'hrsh7th/nvim-cmp' }, -- Autocompletion
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-cmdline' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'L3MON4D3/LuaSnip' },
	{ 'saadparwaiz1/cmp_luasnip',         dependencies = { "rafamadriz/friendly-snippets" } },
	{ 'onsails/lspkind.nvim' },                                -- Icon vs code in Autocompletion
	{ 'dinhhuy258/sfm.nvim',              event = "VeryLazy" }, -- File explorer
})
