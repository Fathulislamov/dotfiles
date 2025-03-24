local function config()
	require("chatgpt").setup({
		model = "gpt-4o-mini",
		max_tokens = 5000,
		api_host_cmd = "echo -n https://api.vsegpt.ru",
		openai_edit_params = {
			model = "gpt-4o-mini",
			max_tokens = 5000,
		},
	})
	local which_key = require("which-key")
	local keymap = {
		{ "<leader>n", group = "Neural" },
		{ "<leader>nc", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
		{ "<leader>ne", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction", mode = { "n", "v" } },
	}

	which_key.add(keymap)
end

return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = config,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim",
	},
}
