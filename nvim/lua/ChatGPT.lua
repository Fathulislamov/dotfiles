return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	opts = {
		api_host_cmd = 'echo -n https://api.proxyapi.ru/openai',
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim"
	}
}
