local function config()
	require("chatgpt").setup({
		-- api_host_cmd = 'echo -n https://api.proxyapi.ru/openai'
		api_host_cmd = 'echo -n https://api.vsegpt.ru'

	})
	local which_key = require("which-key")
	local keymap = {
				 = { "<cmd>ChatGPT<CR>", "ChatGPT" },
		["<Leader>"] = {
			C = {
				c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
				e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
				g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
				t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
				k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
				d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
				a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
				o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
				s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
				f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
				x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
				r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
				l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
			}
		}
	}
	which_key.register(keymap)
end

return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = config,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim"
	}
}
