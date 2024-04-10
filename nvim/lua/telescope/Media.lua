local function config()
	require('telescope').load_extension('luasnip')
	require 'telescope'.setup {
		extensions = {
			media_files = {
				-- filetypes whitelist
				-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
				filetypes = { "png", "webp", "jpg", "jpeg" },
				-- find command (defaults to `fd`)
				find_cmd = "rg"
			}
		},
	}

	local which_key = require("which-key")
	local keymap = {
		["<Leader>"] = {
			t = {
				i = { ':lua require("telescope").extensions.media_files.media_files()<cr>', 'Media files' },
			}
		}
	}
	which_key.register(keymap, { mode = { "n" } })
end

return {
	"nvim-telescope/telescope-media-files.nvim",
	opts = config,
	dependencies = {
		'nvim-lua/popup.nvim',
		'nvim-lua/plenary.nvim',
	}

}
