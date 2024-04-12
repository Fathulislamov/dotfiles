local function config()
	require('telescope').load_extension 'telescope-tabs'
	require('telescope-tabs').setup {
		-- Your custom config :^)
	}

	local which_key = require("which-key")
	local keymap = {
		["<Leader>"] = {
			t = {
				T = { ':Telescope telescope-tabs list_tabs<cr>', 'Tab list' },
			}
		}
	}
	which_key.register(keymap, { mode = { "n" } })
end
return {
	'LukasPietzschmann/telescope-tabs',
	config = config,
	dependencies = { 'nvim-telescope/telescope.nvim' },
}
