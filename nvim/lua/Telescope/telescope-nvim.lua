local function config()
	local actions = require("telescope.actions")
	require("telescope").setup({
		defaults = {
			theme = "center",
			sorting_strategy = "ascending",
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.5,
				},
			},
			mappings = {
				i = {
					["<esc>"] = actions.close,
					["<S-Q>"] = actions.close,
					["<S-j>"] = actions.move_selection_next,
					["<S-k>"] = actions.move_selection_previous,
				},
				n = {
					["h"] = actions.select_horizontal,
					["v"] = actions.select_vertical,
					["K"] = actions.preview_scrolling_up,
					["J"] = actions.preview_scrolling_down,
				},
			},
		},
	})

	local which_key = require("which-key")
	local keymap = {
		{ "<Leader>t", group = "Telescope" },
		{ "<Leader>tb", "<cmd>Telescope buffers initial_mode=normal<cr>", desc = "Buffers" },
		{ "<Leader>tf", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<Leader>tg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
		{ "<Leader>th", "<cmd>Telescope help_tags initial_mode=normal<cr>", desc = "Help tags" },
		{ "<Leader>tl", "<cmd>Telescope builtin initial_mode=normal<cr>", desc = "Builtin" },
		{ "<Leader>tm", "<cmd>Telescope man_page initial_mode=normal<cr>", desc = "Man" },
		{ "<Leader>to", "<cmd>Telescope oldfiles initial_mode=normal<cr>", desc = "Oldfiles" },
		{ "<Leader>ts", ":Telescope luasnip<cr>", desc = "Snippets" },
		{ "<Leader>tn", ":Telescope notify<cr>", desc = "Notifications" },
		-- { "<Leader>tt", "<cmd>Telescope tags<cr>", desc = "Tags" },
	}
	which_key.add(keymap, { mode = { "n", "v" } })

	which_key.setup({
		opts = {
			plugins = {
				disable = {
					buftypes = {},
					filetypes = { "TelescopePrompt" },
				},
			},
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.x",
	config = config,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sharkdp/fd",
	},
}
