local function config()
	local which_key = require("which-key")
	local keymap = {
		["<Leader>"] = {
			q = { ':lua require("confirm-quit").confirm_quit()<cr>', "motion" },
			Q = { ':lua require("confirm-quit").confirm_quit_all()<cr>', "motion" },
		}
	}
	which_key.register(keymap)
end

return {
	'yutkat/confirm-quit.nvim',
	event = "CmdlineEnter",
	config = config,
	lazy = false,
} -- Smart quit
