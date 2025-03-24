local function config()
	require("trouble").setup()
	local which_key = require("which-key")
	local keymap = {
		{ "<leader>adb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
		{ "<leader>adt", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics (Trouble)" },
	}
	which_key.add(keymap)
end

return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	config = config,
}
