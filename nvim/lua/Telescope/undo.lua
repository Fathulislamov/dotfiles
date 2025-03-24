local function config(_, opts)
	require("telescope").load_extension("undo")

	local which_key = require("which-key")
	local keymap = {
		{ "<Leader>tu", "<cmd>Telescope undo initial_mode=normal<cr>", desc = "Undo" },
	}
	which_key.add(keymap, { mode = { "n" } })
end
return {
	"debugloop/telescope-undo.nvim",
	config = config,
}
