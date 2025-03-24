local config = function()
	require("luasnip.loaders.from_vscode").lazy_load()
	local luasnip = require("luasnip")
	local cmp = require("cmp")

	local keys = {
		["<CR>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				if luasnip.expandable() then
					luasnip.expand()
				else
					cmp.confirm({
						select = true,
					})
				end
			else
				fallback()
			end
		end),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.locally_jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}

	local current_mapping = cmp.get_config().mapping or {}
	table.insert(current_mapping, keys)

	local current_sources = cmp.get_config().sources or {}
	table.insert(current_sources, { name = "luasnip" })

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
				luasnip.filetype_extend("javascript", { "javascriptreact" })
				luasnip.filetype_extend("javascript", { "html" })
			end,
			mapping = current_mapping,
			sources = cmp.config.sources(current_sources),
		},
	})
end

return {
	"L3MON4D3/LuaSnip",
	tag = "v2.*",
	config = config,
	dependencies = {
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",
	},
}
