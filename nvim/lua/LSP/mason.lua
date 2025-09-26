return {
	"williamboman/mason.nvim",
	lazy = false,
	-- event = "VeryLazy",
	config = function()
		require("mason").setup()
	end,
}
