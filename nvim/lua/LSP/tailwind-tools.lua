return {
	"luckasRanarison/tailwind-tools.nvim",
	name = "tailwind-tools",
	build = ":UpdateRemotePlugins",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("tailwind-tools").setup({}) -- },
	end,
}
