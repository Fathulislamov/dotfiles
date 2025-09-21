return {
	"jinzhongjia/LspUI.nvim",
	branch = "main",
	config = function()
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
			-- Inlay Hint configuration
			inlay_hint = {
				enable = true,
				command_enable = true,
			},

			-- Signature Help configuration
			signature = {
				enable = true,
				icon = "", -- icon for
				color = { -- color for virtual text
					fg = "#5A5A5A",
					bg = nil,
				},
				debounce = 300, -- debounce delay time
				command_enable = true,
				ui = {
					title = "Signature Help",
					-- border = "rounded",
					winblend = 0,
				},
				keys = {
					quit = "q",
				},
			},
		})
	end
}
