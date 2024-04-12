local function config()
	local which_key = require("which-key")
	local keymap = {
		["<Leader>"] = {
			L = { ':LazyGit<cr>', "Lazygit" }
		}
	}
	which_key.register(keymap)

--	require('lazygit').setup()
end
return {
	"kdheepak/lazygit.nvim",
	event = "VeryLazy",
	config = config,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
