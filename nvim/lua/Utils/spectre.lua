local function config()
	require("rip-substitute").setup({
		popupWin = {
			border = "rounded",
			position = "top", ---@type "top"|"bottom"
		},
	})

	local which_key = require("which-key")
	local keymap = {
		{ "<Leader>r", "<cmd>RipSubstitute<CR>", mode = { "n", "v" }, desc = "Substitute" },
	}
	which_key.add(keymap)
end
return {
	"chrisgrieser/nvim-rip-substitute",
	cmd = "RipSubstitute",
	lazy = false,
	config = config,
}
