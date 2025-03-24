local config = function()
	local which_key = require("which-key")
	local keymap = {
		{ "<Leader>aF", "<cmd>Lspsaga finder <CR>", desc = "Finder" },
		{ "<Leader>aa", "<cmd>Lspsaga code_action<CR>", desc = "Code action" },
		{ "<Leader>adn", ":Lspsaga diagnostic_jump_next<CR>", desc = "Diagnostic next" },
		{ "<Leader>adp", ":Lspsaga diagnostic_jump_prev<CR>", desc = "Diagnostic previous" },
		{ "<Leader>agd", "<cmd>Lspsaga goto_definition <CR>", desc = "Definition" },
		{ "<Leader>agt", "<cmd>Lspsaga goto_type_definition<CR>", desc = "Type definition" },
		{ "<Leader>ah", "<cmd>Lspsaga hover_doc<CR>", desc = "Displays information under the cursor" },
		{ "<Leader>apd", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek definition" },
		{ "<Leader>apt", "<cmd>Lspsaga peek_type_definition<CR>", desc = "Peek type definition" },
	}
	which_key.add(keymap)

	require("lspsaga").setup({
		code_action = {
			show_server_name = true,
		},
		lightbulb = {
			sign = false,
		},
		ui = {
			-- code_action = ''
			code_action = "",
		},
	})
end
return {
	"nvimdev/lspsaga.nvim",
	config = config,
	event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
