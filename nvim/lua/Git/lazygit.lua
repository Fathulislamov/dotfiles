local function config()
	local which_key = require("which-key")
	local keymap = {
		{ "<Leader>gl", ":LazyGit<cr>", desc = "Lazygit" },
	}
	which_key.add(keymap)
end

return {
	"kdheepak/lazygit.nvim",
	config = config,
	event = "VeryLazy",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
