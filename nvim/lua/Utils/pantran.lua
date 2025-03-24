local function config()
	require("pantran").setup({
		default_engine = "yandex",
		ui = {
			width_percentage = 0.9,
			height_percentage = 0.7,
		},
		engines = {
			yandex = {
				fallback = {
					default_source = "en",
					default_target = "ru",
				},
			},
		},
	})

	local which_key = require("which-key")
	local keymap = {
		{ "<Leader>T", "<cmd>Pantran<CR>", desc = "Translate | g? help" },
	}
	which_key.add(keymap)
end

return {
	"potamides/pantran.nvim",
	event = "VeryLazy",
	config = config,
}
