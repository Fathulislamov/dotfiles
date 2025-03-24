local config = function()
	local which_key = require("which-key")
	local keymap = {
		{ "<Leader>g", group = "Git" },
		{ "<Leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Open diff view" },
		{ "<Leader>gq", "<cmd>DiffviewClose<CR>", desc = "Close diff view" },
		{ "<Leader>gr", "<cmd>DiffviewRefresh<CR>", desc = "Refresh diff view" },
		{ "<Leader>gh", "<cmd>DiffviewFileHistory<CR>", desc = "History diff view" },
	}
	which_key.add(keymap)
end
return {
	"sindrets/diffview.nvim",
	config = config,
}
