local config = function()
	local cmp = require("cmp")
	local current_sources = cmp.get_config().sources or {}
	table.insert(current_sources, { name = "dotenv" })
	cmp.setup({
		sources = cmp.config.sources(current_sources),
	})
end

return {
	"SergioRibera/cmp-dotenv",
	config = config,
}
