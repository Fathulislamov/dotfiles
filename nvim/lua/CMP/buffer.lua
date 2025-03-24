local config = function()
	local cmp = require("cmp")
	local cmp_buffer = require("cmp_buffer")

	local config_buffer = {
		name = "buffer",
		option = {
			keyword_length = 1,
			get_bufnrs = function()
				return vim.api.nvim_list_bufs()
			end,
		},
		sorting = {
			comparators = {
				function(...)
					return cmp_buffer:compare_locality(...)
				end,
			},
		},
	}

	local current_sources = cmp.get_config().sources or {}
	table.insert(current_sources, config_buffer)
	cmp.setup({
		sources = cmp.config.sources(current_sources),
	})
end

return {
	"hrsh7th/cmp-buffer",
	config = config,
}
