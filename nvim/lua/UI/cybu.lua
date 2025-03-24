local config = function()
	local ok, cybu = pcall(require, "cybu")
	if not ok then
		return
	end
	cybu.setup({
		position = {
			relative_to = "editor",
			anchor = "topcenter",
			vertical_offset = 30,
		},
		style = {
			path = "tail",
			path_abbreviation = "shortened",
			border = "rounded",
			padding = 3,
			hide_buffer_id = true,
		},
	})
	local which_key = require("which-key")
	local key = {
		{
			"L",
			"<cmd> CybuNext<cr>",
			desc = "Next buffer",
		},
		{
			"H",
			"<cmd> CybuPrev <cr>",
			desc = "Previous buffer",
		},
	}
	which_key.add(key)
end
return {
	"ghillb/cybu.nvim",
	branch = "main",
	config = config,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
}
