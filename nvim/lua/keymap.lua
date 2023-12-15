---@diagnostic disable: undefined-global
local which_key = require("which-key")
-- Remap leader and local leader to <Space>
-- keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>q", require "confirm-quit".confirm_quit)
vim.keymap.set("n", "<leader>Q", require "confirm-quit".confirm_quit_all)

local key = {
	['<leader>'] = {
		l = { '<c-w>l<cr>', "switch cursor right" },
		h = { '<c-w>h<cr>', "switch cursor left" },
		j = { '<c-w>j<cr>', "switch cursor down" },
		k = { '<c-w>k<cr>', "switch cursor up" },
		n = { ':tabnew <cr>', "open new tab" },
		dd = { '"_d<cr>', "delete" },
		s = { '<esc>:w<cr>', "save" },
		x = { '<esc>:so ~/.config/nvim/init.lua<cr>', "reaload config" },
		q = { '<esc>:ConfirmQuit<cr>', "quit" },
		Q = { '<esc>:ConfirmQuitAll<cr>', "quit all" },
		c = { ':nohlsearch<cr>', "clear the highlighting search" },
		i = { '<c-w>r<cr>', "move window left" },
		o = { '<c-w>r<cr>', "move window right" },
		w = { '<esc>:tabprevious <cr>', "tab previous" },
		r = { '<esc>:tabnext <cr>', "tab next" },
	}
}
which_key.register(key)
