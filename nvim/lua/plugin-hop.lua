require 'hop'.setup {
	-- Hop configuration goes there
}

vim.cmd 'highlight HopNextKey guifg=#c2c52d'
vim.cmd 'highlight HopNextKey1 guifg=#c2c52d'
vim.cmd 'highlight HopNextKey2 guifg=#c2c52d'

local which_key = require("which-key")
local keymap = {
	["<Leader>"] = {
		f = { '<cmd>HopWord<CR>', "Motion" },
	}
}
-- which_key.register(keymap)
which_key.register(keymap, { mode = { "n" } })
