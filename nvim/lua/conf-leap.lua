local leap = require('leap')
leap.leap { target_windows = { vim.fn.win_getid() } }
leap.add_default_mappings(true)
local which_key = require("which-key")

local keymap = {
	name = "Jump",
	s = { "Jump forward" },
	S = { "Jump backward" },
	gs = { "Jump global other window" },
}
which_key.register(keymap)
