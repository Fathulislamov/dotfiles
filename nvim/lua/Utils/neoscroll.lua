local function config()
	local neoscroll = require("neoscroll")
	neoscroll.setup({
		mappings = {},
	})

	local which_key = require("which-key")
	local key = {
		{ group = "Scroll" },
		{
			"J",
			":lua require('neoscroll').scroll(0.3, { move_cursor = true, duration = 300 })<cr>",
			desc = "Scroll down",
		},
		{
			"K",
			":lua require('neoscroll').scroll(-0.3, { move_cursor = true, duration = 300 })<cr>",
			desc = "Scroll up",
		},
	}
	which_key.add(key, { mode = { "n", "v", "x" } })
end

return {
	"karb94/neoscroll.nvim",
	event = "VeryLazy",
	opts = config,
}
