local config = function()
	local signature = require("lsp_signature")
	signature.setup({
		hint_enable = false,
		bind = false,
		floating_window = true,
		handler_opts = {
			border = "rounded"
		},
	})

	signature.on_attach()
end

return {
	"ray-x/lsp_signature.nvim",
	tag = "v0.3.1",
	event = "InsertEnter",
	opts = {
		hint_enable = false,
		bind = true,
		floating_window = true,
		-- handler_opts = {
		-- 	border = "rounded"
		-- },
	},
	config = config
}
