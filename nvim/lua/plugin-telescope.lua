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
	},
	extensions = {
		media_files = {
			-- filetypes whitelist
			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			filetypes = { "png", "webp", "jpg", "jpeg", "svg" },
			-- find command (defaults to `fd`)
			--find_cmd = "rg"
		}
	},
}

--require('telescope').load_extension('luasnip')

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
			c = { ':Telescope neoclip<cr>', 'Clipboard' },
--			s = { ':Telescope luasnip<cr>', 'Snippets' },
			p = { ':Telescope media_files<cr>', 'Preview image' },
		}
	}
}
which_key.register(keymap, { mode = { "n" } })



require("telescope").setup {
	defaults = {
		theme = "center",
		sorting_strategy = "ascending",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.5,
			},
		},
	},
}
