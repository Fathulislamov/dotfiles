local which_key = require("which-key")

-- Remap leader and local leader to <Space>
--keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Switch buffer
-- keymap("n", "<S-h>", ":bprevious<CR>", default_opts)
-- keymap("n", "<S-l>", ":bnext<CR>", default_opts)
local key = {
	["<Leader>"] = {
		s = {'<Esc>:w<CR>', "Save"},
		q = {'<Esc>:q<CR>', "Quit"},
		l = {'<C-w>l<CR>', "Switch cursor right"},
		h = {'<C-w>h<CR>', "Switch cursor left"},
		j = {'<C-w>j<CR>', "Switch cursor down"},
		k = {'<C-w>k<CR>', "Switch cursor up"},
		n = {':NvimTreeToggle<CR>', "NvimTree"},
		e = {':NvimTreeToggle<CR>', "Speed NvimTree"},
		c = {':nohlsearch<CR>', "Clear the highlighting search"},
	}
}
which_key.register(key)
