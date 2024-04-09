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
	require('Theme'), -- Colorscheme
	require('Noice'), -- Completely replaces the UI
	--	require('Telescope-file-browser'),
	require('ChatGPT'),
	require('Which-key'),
	require('Auto-save'),                                             -- Auto save
	require('Lualine'),                                               -- Status bar
	require('Neoscroll'),                                             -- Smooth scroll
	require('Toggleterm'),                                            -- Terminal
	require('Pantran'),                                               -- Translate
	require('Hop'),                                                   -- Motion
	require('Treesitter'),                                            -- Motion
	--	require('Hydra'),                     --Custom mode
	require('Colorizer'),                                             -- Highlighting color
	require('Autoclose'),                                             -- Autopair
	require('telescope/Telescope'),                                   -- Autopair
	require('Cmp'),                                                   -- Autopair
	require('Lsp'),                                                   -- Autopair
	{ 'yutkat/confirm-quit.nvim', event = "CmdlineEnter", opts = {} }, -- Smart quit
	{
		'terrortylor/nvim-comment',
		config = function()
			local which_key = require("which-key")
			local keymap = {
				["<Leader>"] = {
					c = { '<cmd>CommentToggle<cr>', "comment" },
				}
			}
			which_key.register(keymap)
			require('nvim_comment').setup({
				-- Linters prefer comment and line to have a space in between markers
				--	 = {
				marker_padding = true,
				-- should comment out empty or whitespace only lines
				comment_empty = true,
				-- trim empty comment whitespace
				comment_empty_trim_whitespace = true,
				-- Should key mappings be created
				create_mappings = true,
				-- Normal mode mapping left hand side
				line_mapping = "gcl",
				-- Visual/Operator mapping left hand side
				operator_mapping = "gc",
				-- text object mapping, comment chunk,,
				comment_chunk_text_object = "ic",
				-- Hook function to call before commenting takes place
				hook = nil
				--	}
			})
		end
	},
	--	require('Comment-nvim'),                                          -- Comment
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
	--	{ 'neovim/nvim-lspconfig' }, -- LSP config
	--	{
	--		'pmizio/typescript-tools.nvim',
	--		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	--		opts = {},
	--	},
	-- Autocompletion
	{ 'L3MON4D3/LuaSnip' },
	{ 'onsails/lspkind.nvim' },                        -- Icon vs code in Autocompletion
	{ 'dinhhuy258/sfm.nvim',      event = "VeryLazy" }, -- File explorer
})
