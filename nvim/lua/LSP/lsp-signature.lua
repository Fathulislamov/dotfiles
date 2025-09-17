return {
	"ray-x/lsp_signature.nvim",
	event = "InsertEnter",
	opts = {
		bind = true,
		handler_opts = {
			border = "rounded",
		},
		floating_window = true,
	},
	-- config = function()
	-- 	-- require("lsp_signature").on_attach()
	-- end,
	config = function(_, opts)
		require("lsp_signature").setup(opts)
	end,
}
