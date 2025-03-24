local function config()
	local which_key = require("which-key")
	local keymap = {
		{ "<Leader>Q", ':lua require("confirm-quit").confirm_quit_all()<cr>', desc = "Quit all" },
		{ "<Leader>q", ':lua require("confirm-quit").confirm_quit()<cr>', desc = "Quit" },
	}
	which_key.add(keymap)
end

return {
	"yutkat/confirm-quit.nvim",
	event = "CmdlineEnter",
	config = config,
}
