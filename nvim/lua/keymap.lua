local which_key = require("which-key")
-- Remap leader and local leader to <Space>
--keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Switch buffer
-- keymap("n", "<S-h>", ":bprevious<CR>", default_opts)
-- keymap("n", "<S-l>", ":bnext<CR>", default_opts)
local key = {
	['<A-i>'] = { '<Esc>:tabprevious <CR>', "Tab previous" },
	['<A-o>'] = { '<Esc>:tabnext <CR>', "Tab next" },
	['<Leader>'] = {
		l = { '<C-w>l<CR>', "Switch cursor right" },
		h = { '<C-w>h<CR>', "Switch cursor left" },
		j = { '<C-w>j<CR>', "Switch cursor down" },
		k = { '<C-w>k<CR>', "Switch cursor up" },
		n = { ':tabnew <CR>', "Open new tab" },
		dd = { '"_d<CR>', "Delete" },
		s = { '<Esc>:w<CR>', "Save" },
		r = { '<Esc>:so ~/.config/nvim/init.lua<CR>', "Reaload config" },
		q = { '<Esc>:q!<CR>', "Quit" },
		c = { ':nohlsearch<CR>', "Clear the highlighting search" },
	}
}
which_key.register(key)
