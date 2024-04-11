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
	require('Theme'),              -- Colorscheme
	require('Noice'),              -- Completely replaces the UI
	require('ChatGPT'),            -- ChatGPT
	require('Which-key'),
	require('Auto-save'),          -- Auto save
	require('Lualine'),            -- Status bar
	require('Neoscroll'),          -- Smooth scroll
	require('Toggleterm'),         -- Terminal
	require('Pantran'),            -- Translate
	require('Hop'),                -- Motion
	require('Treesitter'),         -- Motion
	--require('Hydra'),              --Custom mode
--	require('Colorizer'),          -- Highlighting color
	require('Autoclose'),          -- Autopair
	require('telescope/Telescope'), -- Fuzzy finder
	require('Cmp'),                -- Completion
	require('Lsp'),                -- Autopair
	require('Nvim-comment'),       -- Autopair
	require('Confirm-quit'),       -- Smart quit
	require('Lazygit'),
	require('Neo-tree'),
	require('LuaSnip'),
	require('Tabscope'),
-- require('Cokeline'),
-- { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

	--	{
	--		'pmizio/typescript-tools.nvim',
	--		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	--		opts = {},
	--	},
})
