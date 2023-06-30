local cmd = vim.cmd -- execute Vim commands
local set = vim.opt -- global/buffer/windows-scoped options
set.number = true -- Enable line numbering
set.wrap = false -- Not transfer skin
set.tabstop = 2 -- Tab width setting
set.shiftwidth = 2 -- Tab width setting
set.smarttab = true -- Tab width setting
set.expandtab = false -- Tab width setting
set.swapfile = false -- Disable swap file creation
set.termguicolors = true -- Sets 256 colors
cmd 'syntax on' -- Enable syntax highlighting
cmd 'syntax enable' -- Enable syntax highlighting
cmd 'set signcolumn=no'
-- vim.g.codedark_conservative=1

cmd 'colorscheme codedark'

--cmd 'highlight Normal guibg=NONE ctermbg=NONE'
--cmd 'highlight NonText guibg=NONE ctermbg=NONE'
--cmd 'highlight EndOfBuffer guibg=NONE ctermbg=NONE'
--cmd 'highlight LineNr guibg=NONE ctermbg=NONE'
--cmd [[                           
--augroup kitty_padding_color
 --   autocmd!
 --   au VimEnter * :silent !kitty @ set-colors background=\#000000
 --   au VimLeave * :silent !kitty @ set-colors background=\#000000
--augroup END
--]]

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()
require('packer').startup(function(use)
	use { 'wbthomason/packer.nvim' } -- Packer сам себя
	use { 'tomasiser/vim-code-dark' } -- Colorscheme
	use { 'folke/which-key.nvim' } -- Keyboard shortcut hint
	use { 'kyazdani42/nvim-tree.lua' } -- Exlorer
	use { 'Pocco81/auto-save.nvim' } -- Auto save
	use { 'kyazdani42/nvim-web-devicons' } -- Icons
	use { 'karb94/neoscroll.nvim' } -- Smooth scroll
	use { 'nvim-lua/plenary.nvim' } -- Dependense telescope
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' } -- Find
	use { 'nvim-lualine/lualine.nvim' } -- Status bar
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Syntax hilighlighting
	use { 'p00f/nvim-ts-rainbow' } -- Rainbow parentheses
	use { 'numToStr/Comment.nvim' } -- Commenting
	use { 'JoosepAlviste/nvim-ts-context-commentstring' } -- Dependense Comment
	use { 'akinsho/toggleterm.nvim' } -- Terminal
	use { "windwp/nvim-autopairs" } --  Autopairs
	use { 'folke/noice.nvim' } -- UI for messages, cmdline and the popupmenu
	use { 'MunifTanjim/nui.nvim' } -- Dependense nvim-notify
	use { 'rcarriga/nvim-notify' } -- Dependense nvim-notify
	use { 'windwp/nvim-ts-autotag' } -- source for vim's cmdline
	use { 'potamides/pantran.nvim' } -- Translate
	--  LSP
	use { 'williamboman/mason.nvim' } -- Package manager for LSP and DAP servers
	use { 'williamboman/mason-lspconfig.nvim' } -- Briges mason.nvim with the lspconfig
	use { 'neovim/nvim-lspconfig' } -- Collection of configurations for the built-in LSP client
	use { 'kosayoda/nvim-lightbulb' } -- Bulb for neovim's built-in LSP
	use { 'onsails/lspkind.nvim' } -- Icons
	use { 'j-hui/fidget.nvim' } -- Lsp progress
	-- Auto Completion
	use { 'hrsh7th/nvim-cmp' } -- Completion engine
	use { 'hrsh7th/cmp-nvim-lsp' } -- Lsp client for cmp
	use { 'hrsh7th/vim-vsnip' } -- Snippets plugin
	use { 'hrsh7th/cmp-vsnip' } -- Sourse for snippets
	use { 'rafamadriz/friendly-snippets' } -- Snippets collection
	use { 'ray-x/cmp-treesitter' } -- Source for treesitter nodes
	use { 'hrsh7th/cmp-buffer' } -- Source for buffer words
	use { 'hrsh7th/cmp-path' } -- Source for filesystem paths
	use { 'ggandor/leap.nvim' } -- Easy jump
	use {'edluffy/hologram.nvim'}
	use { 'adelarsq/image_preview.nvim' }

	if packer_bootstrap then
		require('packer').sync()
	end
end)

require('hologram').setup{
    auto_display = true -- WIP automatic markdown image display, may be prone to breaking
}


--require("image_preview").setup({})



require('conf-nvim-tree')
--require('conf-leap')
--require('conf-mason-lspconfig')
--require('conf-mason')
--require('conf-fidget')
--require('conf-keymap')
--require('conf-which-key')
--require('conf-auto-save')
--require('conf-neoscroll')
--require('conf-telescope')
--require('conf-lualine-new')
--require('conf-treesitter')
--require('conf-ts-rainbow')
--require('conf-comment')
--require('conf-lsp-config')
--require('conf-cmp')
--require('conf-autopairs')
--require('conf-toggleterm')
--require('conf-lightbubl')
--require('conf-lspkind')
--require('conf-noice')
--require('conf-nvim-ts-autotag')
--require('conf-pantran')
