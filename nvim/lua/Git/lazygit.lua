local function config()
	local which_key = require("which-key")
	local keymap = {
		{ "<Leader>gl", ":LazyGit<cr>", desc = "Lazygit" },
	}
	which_key.add(keymap)
end

return {
	"kdheepak/lazygit.nvim",
	lazy = false,
	config = config,
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
