local function config()
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
		name = 'CHANGE BUFFER',
		mode = 'n',
		body = '<Leader>b',
		hint = [[ Change buffer ]],
		config = {
			foreign_keys = nil,
			exit = true,
			color = "pink",
			--		hint = false,
		},
		heads = {
			{ 'l', '<cmd>bprevious<CR>' },
			{ 'h', '<cmd>bnext<CR>', { desc = '←/→' } },
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
				},
				b = {
					name = 'Change buffer',
					h = 'Next buffer',
					l = 'Previous buffer',
				}
			}
		}
	}
	which_key.register(keymap)
end

return {
	--	'Frederick888/hydra.nvim',
	"nvimtools/hydra.nvim",
	branch = "self",
	config = config
}
