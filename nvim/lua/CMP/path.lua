local config = function()
	local cmp = require("cmp")
	local current_sources = cmp.get_config().sources or {}
	table.insert(current_sources, { name = "path" })
	cmp.setup({
		sources = cmp.config.sources(current_sources),
	})
end

return {
	"hrsh7th/cmp-path",
	config = config,
}
