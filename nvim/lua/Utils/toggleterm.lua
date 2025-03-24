local function config()
	require("toggleterm").setup({
		direction = "float",
		float_opts = {
			border = "rounded",
		},
	})

	local which_key = require("which-key")
	local keymap = {
		{ "<c-t>", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal", mode = { "n", "t" } },
	}
	which_key.add(keymap)
end
return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = config,
	},
}
