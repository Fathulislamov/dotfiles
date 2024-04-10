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
	-- setting the keybinding for LazyGit with 'keys' is recommended in
	-- order to load the plugin when the command is run for the first time
	--	keys = {
	--	{ "<leader>lG", "<cmd>LazyGit<cr>", desc = "LazyGit" }
	--	}
}
