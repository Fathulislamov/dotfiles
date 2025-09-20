local function config()
	require("avante").setup({
		-- system_prompt = "You are a helpful assistant who speaks Russian. Пожалуйста, отвечай на русском языке.",
		-- debug = true,
		instructions_file = "avante.md",
		windows = {
			position = "left",
		},
		behaviour = {
			auto_set_highlight_group = true,
			auto_set_keymaps = false,
		},
		provider = "openai",
		providers = {
			openai = {
				endpoint = "https://api.vsegpt.ru/v1",
				model = "openai/gpt-3.5-turbo",
				timeout = 30000, -- Timeout in milliseconds
				extra_request_body = {
					temperature = 0.3,
					max_tokens = 4000,
				},
			},
		},
		web_search_engine = {
			provider = "google", -- tavily, serpapi, google, kagi, brave, or searxng
			-- proxy = nil, -- proxy support, e.g., http://127.0.0.1:7890
		},
	})
	local which_key = require("which-key")
	local keymap = {
		{ "<leader>na", "<cmd>NoNeckPain<CR><cmd>AvanteToggle<CR><cmd>NoNeckPain<CR>", desc = "Toggle Avante" },
		{ "<leader>ae", "<cmd>AvanteEdit<CR>", desc = "Avante edit", mode = { "v" } },
		{
			"<leader>aa",
			"<cmd>NoNeckPain<CR><cmd>AvanteAsk<CR><cmd>NoNeckPain<CR>",
			desc = "Avante ask",
			mode = { "v" },
		},
	}

	which_key.add(keymap)
end

return {
	"yetone/avante.nvim",
	build = "make",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	config = config,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"echasnovski/mini.pick", -- для провайдера file_selector mini.pick
		"nvim-telescope/telescope.nvim", -- для провайдера file_selector telescope
		"hrsh7th/nvim-cmp", -- автодополнение для команд avante и упоминаний
		"ibhagwan/fzf-lua", -- для провайдера file_selector fzf
		"stevearc/dressing.nvim", -- для провайдера ввода dressing
		"folke/snacks.nvim", -- для провайдера ввода snacks
		"nvim-tree/nvim-web-devicons", -- или echasnovski/mini.icons
		"echasnovski/mini.pick", -- для провайдера file_selector mini.pick
		"nvim-telescope/telescope.nvim", -- для провайдера file_selector telescope
		"hrsh7th/nvim-cmp", -- автодополнение для команд avante и упоминаний
		"ibhagwan/fzf-lua", -- для провайдера file_selector fzf
		"stevearc/dressing.nvim", -- для провайдера ввода dressing
		"folke/snacks.nvim", -- для провайдера ввода snacks
		"nvim-tree/nvim-web-devicons", -- или echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
