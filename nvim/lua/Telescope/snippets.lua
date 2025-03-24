local function config()
	require("telescope").load_extension("luasnip")
end

return {
	"benfowler/telescope-luasnip.nvim",
	module = "telescope._extensions.luasnip",
	opts = config,
}
