local function config()
	require("codeium").setup({
		virtual_text = {
			enabled = true,
			key_bindings = {
				accept = "<Space><Tab>",
			},
		},
		workspace_root = {
			use_lsp = true,
		},
	})

	local cmp = require("cmp")
	local current_sources = cmp.get_config().sources or {}
	table.insert(current_sources, { name = "codeium" })

	cmp.setup({
		sources = cmp.config.sources(current_sources),
	})
end

return {
	"Exafunction/codeium.nvim",
	config = config,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
}
