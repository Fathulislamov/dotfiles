local function config()
	api_host_cmd = 'echo -n https://api.proxyapi.ru/openai'

	local which_key = require("which-key")
	local keymap = {
		["<Leader>"] = {
			c = { '<cmd>chatgpt<cr>', "motion" },
		}
	}
	which_key.register(keymap)
end
return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	opts = config,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim"
	}
}
