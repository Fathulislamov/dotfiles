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
	require('Which-key'),          -- Keymap
	require('Auto-save'),          -- Auto save
	require('Lualine'),            -- Status bar
	require('Neoscroll'),          -- Smooth scroll
	require('Toggleterm'),         -- Terminal
	require('Pantran'),            -- Translate
	require('Hop'),                -- Motion
	require('Treesitter'),         -- Highlighting
	--require('Hydra'),              --Custom mode
	require('Colorizer'),          -- Highlighting color
	require('Autoclose'),          -- Autopair
	require('telescope/Telescope'), -- Fuzzy finder
	require('Cmp'),                -- Completion
	require('Lsp'),                -- Language server
	require('Nvim-comment'),       -- Comment
	require('Confirm-quit'),       -- Smart quit
	require('Lazygit'),            -- Git
	require('Neo-tree'),           -- File explorer
	require('LuaSnip'),            -- Snippets
	require('Cokeline'),           -- Bufferline
})
