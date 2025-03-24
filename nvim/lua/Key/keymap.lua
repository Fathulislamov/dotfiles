vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_set_keymap("n", "q", "<Nop>", { noremap = true, silent = true })

local which_key = require("which-key")
local key = {
	{ "<leader>l", "<c-w>l<cr>", desc = "Switch cursor right" },
	{ "<leader>h", "<c-w>h<cr>", desc = "Switch cursor left" },
	{ "<leader>j", "<c-w>j<cr>", desc = "Switch cursor down" },
	{ "<leader>k", "<c-w>k<cr>", desc = "Switch cursor up" },
	{ "<leader>N", ":tabnew <cr>", desc = "Open new tab" },
	{ "<leader>dd", '"_d<cr>', desc = "Delete" },
	-- { "<leader>s", "<esc>:w<cr>", desc = "Save" },
	{ "<leader>ch", ":nohlsearch<cr>", desc = "Clear the highlighting search" },
	{ "<leader>mi", "<c-w>H<cr>", desc = "Move window left" },
	{ "<leader>mo", "<c-w>L<cr>", desc = "Move window right" },
	{ "<leader>o", "<c-o>", desc = "Jump to older cursor position" },
	{ "<S-Tab>", "<esc>:tabprevious <cr>", desc = "Tab previous" },
	{ "<Tab>", "<esc>:tabnext <cr>", desc = "Tab previous" },
	{ "<leader>u", "<esc>:set number!<cr>", desc = "Toggle line-numbering" },
	-- { "H", "<esc>:bn<cr>", desc = "Next buffer" },
	-- { "L", "<esc>:bp<cr>", desc = "Previous buffer" },
}
which_key.add(key)
