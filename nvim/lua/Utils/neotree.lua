local config = function()
	require("neo-tree").setup({
		popup_border_style = "rounded",
		enable_git_status = false,
		default_component_configs = {
			indent = {
				with_markers = false,
			},
		},
		window = {
			position = "float",
			width = 20,
		},
	})

	local which_key = require("which-key")
	local keymap = {
		{ "<Leader>e", ":Neotree<cr>", desc = "File Explorer", mode = { "n", "v" } },
	}
	which_key.add(keymap)
end

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	config = config,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		require("Utils/image"),
	},
}
