---@diagnostic disable: undefined-global
local which_key = require("which-key")
-- Remap leader and local leader to <Space>
-- keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local key = {
	['<Leader>'] = {
		l = { '<C-w>l<CR>', "Switch cursor right" },
		h = { '<C-w>h<CR>', "Switch cursor left" },
		j = { '<C-w>j<CR>', "Switch cursor down" },
		k = { '<C-w>k<CR>', "Switch cursor up" },
		n = { ':tabnew <CR>', "Open new tab" },
		dd = { '"_d<CR>', "Delete" },
		s = { '<Esc>:w<CR>', "Save" },
		x = { '<Esc>:so ~/.config/nvim/init.lua<CR>', "Reaload config" },
		q = { '<Esc>:q!<CR>', "Quit" },
		c = { ':nohlsearch<CR>', "Clear the highlighting search" },
		i = { '<C-w>R<CR>', "Move window left" },
		o = { '<C-w>r<CR>', "Move window right" },
	  w = { '<Esc>:tabprevious <CR>', "Tab previous" },
		r = { '<Esc>:tabnext <CR>', "Tab next" },
	}
}
which_key.register(key)
