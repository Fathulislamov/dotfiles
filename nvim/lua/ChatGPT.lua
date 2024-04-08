local function config()
	      require("chatgpt").setup({
					api_host_cmd = 'echo -n https://api.proxyapi.ru/openai'
})

end
--	local which_key = require("which-key")
	local keymap = {
		["<Leader>"] = {
			c = { '<cmd>chatgpt<cr>', "motion" },
		}
	}
--	which_key.register(keymap)
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
