local function config()
	local which_key = require("which-key")
	local keymap = {
 		["<Leader>"] = {
			t = {
				c = { ':Telescope neoclip initial_mode=normal<cr>', 'Clipboard' },
			}
		}
	}
	which_key.register(keymap, { mode = { "n" } })

	require('neoclip').setup()
end

return {
	"AckslD/nvim-neoclip.lua",
	requires = {
		{ 'kkharji/sqlite.lua', module = 'sqlite' },
		-- you'll need at least one of these
		-- {'nvim-telescope/telescope.nvim'},
		-- {'ibhagwan/fzf-lua'},
	},
	config = config
}
