local config = function()
	require("auto-save").setup({
		execution_message = {
			message = "",
		},
		trigger_events = { "InsertLeave" },
		debounce_delay = 10000,
		conditions = false,
	})
end

return {
	"Pocco81/auto-save.nvim",
	event = "VeryLazy",
	config = config,
}
