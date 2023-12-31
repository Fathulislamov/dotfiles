local Hydra = require('hydra')

Hydra({
	name = 'SIDE SCROOL',
	mode = 'n',
	body = '<Leader>zs',
	config = {
		--	foreign_keys = 'warn',
		--	exit = false,
		color = "pink",
		--		hint = false,
	},
	heads = {
		{ 'h', '5zh' },
		{ 'l', '5zl', { desc = '←/→' } },
	}
})

Hydra({
	name = 'RESIZE',
	mode = 'n',
	body = '<Leader>zr',
	config = {
		color = "pink",
	},
	heads = {
		{ 'l', ':vertical resize +5<CR>' },
		{ 'h', ':vertical resize -5<CR>' },
	}
})

local which_key = require("which-key")
local keymap = {
	["<Leader>"] = {
		z = {
			name = 'Hydra',
			s = {
				name = 'Horisontal scroll',
				h = 'Scroll left',
				l = 'Scroll right',
			},
			r = {
				name = 'Resize window',
				h = 'Resize window left',
				l = 'Resize window right',
			}
		}
	}
}
which_key.register(keymap)
