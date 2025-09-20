return
{
	"Dan7h3x/signup.nvim",
	branch = "main",
	opts = {
		-- Your configuration options here
		silent = true,
		icons = {
			parameter = "parameter",
			method = "󰡱",
			documentation = "󱪙",
			type = "󰌗",
			default = "󰁔",
		},
		colors = {
			parameter = "#1a1a1a",
			method = "#1a1a1a",
			documentation = "#1a1a1a",
			default_value = "#1a1a1a",
			type = "#1a1a1a",
		},
		active_parameter = true, -- enable/disable active_parameter highlighting
		active_parameter_colors = {
			bg = "#1a1a1a",
			fg = "#1a1a1a",
		},
		border = "rounded",
		dock_border = "rounded",
		winblend = 10,
		auto_close = true,
		trigger_chars = { "(", ",", ")" },
		max_height = 20,
		max_width = 80,
		floating_window_above_cur_line = true,
		debounce_time = 50,
		dock_toggle_key = "<A-key>",
		dock_mode = {
			enabled = false,
			position = "bottom", -- "bottom", "top", or "middle"
			height = 4,          -- If > 1: fixed height in lines, if <= 1: percentage of window height (e.g., 0.3 = 30%)
			padding = 1,         -- Padding from window edges
			side = "right",      -- "right", "left", or "center"
			width_percentage = 40, -- Percentage of editor width (10-90%)
		}
	},

	config = function(_, opts)
		require("signup").setup(opts)
	end
}
