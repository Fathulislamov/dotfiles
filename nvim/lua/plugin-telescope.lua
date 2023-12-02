local actions = require("telescope.actions")
require("telescope").setup {
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<S-j>"] = actions.move_selection_next,
				["<S-k>"] = actions.move_selection_previous,

			},
		},
	}
}


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>wf', builtin.find_files, {})
vim.keymap.set('n', '<leader>wg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>wb', builtin.buffers, {})
vim.keymap.set('n', '<leader>wh', builtin.help_tags, {})


local which_key = require("which-key")
local keymap = {
	["<Leader>"] = {
		w = {
			name = "Telescope",
			f = "Find file",
			g = "Live grep",
			b = "Find buffers",
			h = "Help tags",
		}
	}
}
which_key.register(keymap, { mode = { "n" } })
