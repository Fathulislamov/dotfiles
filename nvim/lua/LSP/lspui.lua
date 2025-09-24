local function config()
	require("LspUI").setup({
		-- General settings
		prompt = {
			border = false,
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		},

		code_action = {
			enable = false,
		},
		hover = {
			enable = false,
		},
		rename = {
			enable = false,
		},
		diagnostic = {
			enable = false,
		},
		definition = {
			enable = false,
		},

		-- Reference configuration
		reference = {
			enable = true,
			command_enable = true,
			ui = {
				title = "Reference",
				border = "rounded",
				winblend = 0,
			},
			keys = {
				quit = "q",
				exec = "<CR>",
				vsplit = "v",
				split = "s",
				tabe = "t",
			},
		},
		implementation = {
			enable = false,
		},
		type_definition = {
			enable = false,
		},
		declaration = {
			enable = false,
		},
		call_hierarchy = {
			enable = false,
		},
		lightbulb = {
			enable = false,
		},
		inlay_hint = {
			enable = false,
		},
		signature = {
			enable = false,
		},
	})

	local which_key = require("which-key")
	local keymap = {
		{ "<Leader>an", "<cmd>LspUI reference<CR>", desc = "references" },
	}
	which_key.add(keymap)
end

return {
	"jinzhongjia/LspUI.nvim",
	branch = "main",
	event = "LspAttach",
	config = config,
}
