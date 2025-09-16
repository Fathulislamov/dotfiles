local function config()
	require("wtf").setup({
		-- chat_dir = vim.fn.stdpath("data"):gsub("/$", "") .. "/wtf/chats",
		-- popup_type = "popup",
		-- openai_api_key = os.getenv("OPENAI_API_KEY"),
		-- base_url = "https://api.vsegpt.ru/v1",
		-- openai_model_id = "openai/gpt-5-nano",
		-- context = true,
		-- language = "russian",
		-- search_engine = "google",
	})

	local which_key = require("which-key")
	-- local keymap = {
	-- 	{ "<Leader>nw", "<cmd>Wtf<cr>", desc = "Debug diagnostic with AI" },
	-- 	{ "<Leader>ns", "<cmd>WtfSearch<cr>", desc = "Search diagnostic with Google" },
	-- 	{
	-- 		"<Leader>nh",
	-- 		':lua require("wtf").history()<cr>',
	-- 		desc = "Populate the quickfix list with previous chat history",
	-- 	},
	-- 	-- { "<Leader>ng", ':lua require("wtf").grep_history()<cr>', desc = "Grep previous chat history with Telescope" },
	-- }

	local keymap = {
		{ "<leader>nwd", '<cmd>lua require("wtf").diagnose()<cr>', desc = "Debug diagnostic with AI" },
		{ "<leader>nwf", '<cmd>lua require("wtf").fix()<cr>', desc = "Fix diagnostic with AI" },
		{ "<leader>nws", '<cmd>lua require("wtf").search()<cr>', desc = "Search diagnostic with Google" },
		{ "<leader>nwp", '<cmd>lua require("wtf").pick_provider()<cr>', desc = "Pick provider" },
		{
			"<leader>nwh",
			'<cmd>lua require("wtf").history()<cr>',
			desc = "Populate the quickfix list with previous chat history",
		},
		{
			"<leader>nwg",
			'<cmd>lua require("wtf").grep_history()<cr>',
			desc = "Grep previous chat history with Telescope",
		},
	}
	which_key.add(keymap)
end

return {
	"bennettjohnson/wtf.nvim",
	config = config,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim",
	},
}
