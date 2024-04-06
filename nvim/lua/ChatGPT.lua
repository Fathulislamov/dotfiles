WELCOME_MESSAGE = [[

     If you don't ask the right questions,
        you don't get the right answers.
                                      ~ Robert Half
]]

--local notify = require('notify')
--notify.("Authorization: Bearer " .. os.getenv('OPENAI_API_KEY'))
local config = {
	api_host_cmd = 'echo -n https://api.proxyapi.ru/openai',
}

return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
		require("chatgpt").setup(config)
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim"
	}
}
