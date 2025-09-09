return {
	"yetone/avante.nvim",
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	-- ⚠️ must add this setting! ! !
	build = "make",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	---@module 'avante'
	---@type avante.Config
	opts = {
		-- add any opts here
		-- this file can contain specific instructions for your project
		system_prompt = "You are a helpful assistant who speaks Russian. Пожалуйста, отвечай на русском языке.",
		debug = true,
		instructions_file = "avante.md",
		-- for example
		windows = {
			position = "left",
		},
		provider = "openai",
		providers = {
			openai = {
				endpoint = "https://api.vsegpt.ru/v1",
				model = "openai/gpt-5-nano",
				timeout = 30000, -- Timeout in milliseconds
				extra_request_body = {
					temperature = 0.75,
					max_tokens = 400000,
				},
			},
			claude = {
				endpoint = "https://api.anthropic.com",
				model = "claude-sonnet-4-20250514",
				timeout = 30000, -- Timeout in milliseconds
				extra_request_body = {
					temperature = 0.75,
					max_tokens = 20480,
				},
			},
			moonshot = {
				endpoint = "https://api.moonshot.ai/v1",
				model = "kimi-k2-0711-preview",
				timeout = 30000, -- Timeout in milliseconds
				extra_request_body = {
					temperature = 0.75,
					max_tokens = 32768,
				},
			},
		},
	},
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
