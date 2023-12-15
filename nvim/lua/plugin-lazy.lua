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

require("lazy").setup({
	{ 'tomasiser/vim-code-dark' },                                                -- Colorscheme
	{ 'folke/noice.nvim',                 event = "VeryLazy", },                  -- Notification
	{ 'MunifTanjim/nui.nvim', },                                                  -- Dependencies noice
	{ 'rcarriga/nvim-notify' },                                                   -- Dependencies noice
	{ 'dinhhuy258/sfm.nvim',              event = "VeryLazy" },                   -- File explorer
	{ 'folke/which-key.nvim',             event = "VeryLazy" },                   -- Keyboard shortcut hint
	{ 'kyazdani42/nvim-web-devicons',     event = "VeryLazy" },                   -- Icons
	{ 'Pocco81/auto-save.nvim',           event = "VeryLazy" },                   -- Auto save
	{ 'karb94/neoscroll.nvim',            event = "VeryLazy" },                   -- Smooth scroll
	{ 'nvim-lualine/lualine.nvim' },                                              -- Status bar
	{ 'akinsho/toggleterm.nvim',          event = "VeryLazy" },                   -- Terminal
	{ 'rcarriga/nvim-notify',             event = "VeryLazy" },                   -- Notification	
	{ "potamides/pantran.nvim",           event = "VeryLazy" },                   -- Translate
	{ 'nvim-treesitter/nvim-treesitter',  build = ":TSUpdate" },                  -- Highlighting
	{ 'Frederick888/hydra.nvim',          branch = "self" },                      -- Custom mode
	{ 'phaazon/hop.nvim', },                                                      -- Motion
	{ 'nvim-telescope/telescope.nvim',    branch = '0.1.x', },                    -- Fuzzy finder
	{ 'nvim-lua/plenary.nvim' },                                                  -- Dependencies telescope
	{ 'NvChad/nvim-colorizer.lua', },                                              -- Highlighting color
	{ 'yutkat/confirm-quit.nvim',         event = "CmdlineEnter", opts = {} },    -- Smart quit
	{ 'm4xshen/autoclose.nvim' },                                                 -- Autopair
	{ 'numToStr/Comment.nvim',            opts = {},              lazy = false, }, -- Comment
	-- LSP
	{ 'neovim/nvim-lspconfig' },                                                  -- LSP config
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	-- Autocompletion
	{ 'hrsh7th/nvim-cmp' }, -- Autocompletion
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-cmdline' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'L3MON4D3/LuaSnip' },
	{ 'saadparwaiz1/cmp_luasnip' },
	{ 'onsails/lspkind.nvim' }, -- Icon vs code in Autocompletion
})
