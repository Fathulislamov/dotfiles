local function config()
	local which_key = require("which-key")
	local keymap = {
		{ "<Leader>tc", ":Telescope neoclip initial_mode=normal<cr>", desc = "Clipboard" },
	}
	which_key.add(keymap, { mode = { "n" } })

	require("neoclip").setup({
		enable_persistent_history = true,
		on_select = {
			move_to_front = true,
			close_telescope = true,
		},
	})
end

return {
	"AckslD/nvim-neoclip.lua",
	config = config,
	dependencies = {
		{ "kkharji/sqlite.lua", module = "sqlite" },
	},
}
