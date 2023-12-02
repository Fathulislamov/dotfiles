local Hydra = require('hydra')

Hydra({
	name = 'SIDE SCROOL',
	mode = 'n',
	body = 'z',
	config = {
		--	foreign_keys = 'warn',
		--	exit = false,
		color = "red",
		--		hint = false,
	},
	heads = {
		{ 'h', '5zh' },
		{ 'l', '5zl', { desc = '←/→' } },
		{ 'l', '5zl' },
		{ 'H', 'zH' },
		{ 'L', 'zL', { desc = 'half screen ←/→' } },
		{ 'L', 'zL' },
	}
})
--[[
Hydra({
	name = 'CURSOR MOVE',
	mode = 'n',
	body = 'z',
	config = {
--		foreign_keys = nil,
--		exit = true,
		color = "pink",
--[[		hint = {
--			type = 'window'
		},
	},
	heads = {
		{ 'j', '<C-w>j' },
		{ 'k', '<C-w>k' },
		{ 'h', '<C-w>h' },
		{ 'l', '<C-w>l' },
	}
})
--]]
