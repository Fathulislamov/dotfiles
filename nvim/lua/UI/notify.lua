local config = function()
	require("notify").setup({
		stages = "fade",
		top_down = false,
	})
end
return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = config,
}
