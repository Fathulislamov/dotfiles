local config = function()
	require("noice").setup({
		presets = {
			command_palette = true, -- position the cmdline and popupmenu together
		},
	})
	local which_key = require("which-key")
	local keymap = {
		{ "<Leader>ml", ":Noice last<cr>", desc = "Last message " },
		{ "<Leader>me", ":Noice errors<cr>", desc = "Errors message " },
		{ "<Leader>mt", ":Noice pick<cr>", desc = "Pick message " },
	}
	which_key.add(keymap, { mode = { "n" } })
end
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	config = config,
	dependencies = {
		"MunifTanjim/nui.nvim",
		require("UI/notify"),
	},
}
