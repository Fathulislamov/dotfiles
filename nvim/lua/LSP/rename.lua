local config = function()
	require("noice").setup({
		presets = { inc_rename = true },
	})

	local which_key = require("which-key")
	local keymap = {
		{ "<Leader>ar", ":IncRename", desc = "Rename" },
	}
	which_key.add(keymap)

	require("inc_rename").setup()
end
return {
	"smjonas/inc-rename.nvim",
	config = config,
	dependencies = { "noice.nvim" },
}
