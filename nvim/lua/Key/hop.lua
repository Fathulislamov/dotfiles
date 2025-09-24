local function config()
	vim.cmd("highlight HopNextKey guifg=#c2c52d")
	vim.cmd("highlight HopNextKey1 guifg=#9CDCFE")
	vim.cmd("highlight HopNextKey2 guifg=#C98D75")

	local which_key = require("which-key")
	local keymap = {
		{ "<Leader>f", "<cmd>HopWord<CR>", desc = "Motion", mode = { "n", "v" } },
	}
	which_key.add(keymap)

	require("hop").setup({
		multi_windows = true,
		uppercase_labels = true,
		keys = "etovxqpdygfblzhckisuran",
	})
end

return {
	"smoka7/hop.nvim",
	version = "*",
	event = "VeryLazy",
	config = config,
}
