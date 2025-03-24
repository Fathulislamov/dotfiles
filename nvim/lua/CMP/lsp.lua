local config = function()
	local cmp = require("cmp")
	local current_sources = cmp.get_config().sources or {}
	table.insert(current_sources, { name = "nvim_lsp" })
	cmp.setup({
		sources = cmp.config.sources(current_sources),
	})

	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	local lspconfig = require("lspconfig")
	local available_servers = lspconfig.util.available_servers()
	for _, server in ipairs(available_servers) do
		lspconfig[server].setup({
			capabilities = capabilities,
		})
	end
end

return {
	"hrsh7th/cmp-nvim-lsp",
	config = config,
}
