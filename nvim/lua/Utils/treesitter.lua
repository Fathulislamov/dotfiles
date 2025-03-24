local function config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
			"bash",
			"css",
			"diff",
			"dockerfile",
			"json",
			"javascript",
			"typescript",
			"tsx",
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = config,
}
