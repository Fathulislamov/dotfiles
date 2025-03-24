local config = function()
	local neotree = require("neo-tree")
	local current_sources = neotree.config or {}
	local opts = {
		popup_border_style = "rounded",
		enable_git_status = false,
		hide_root_node = true,
		retain_hidden_root_indent = true,
		default_component_configs = {
			indent = {
				with_markers = false,
				with_expanders = true,
				expander_collapsed = "",
				expander_expanded = "",
			},
		},
		window = {
			position = "float",
			width = 20,
		},
		filesystem = {
			filtered_items = {
				show_hidden_count = false,
				never_show = {
					".DS_Store",
				},
			},
		},
		nesting_rules = require("neotree-file-nesting-config").nesting_rules,
	}

	table.insert(current_sources, opts)
	neotree.setup({ current_sources })
	require("neo-tree").setup(opts)
end

return {
	"saifulapm/neotree-file-nesting-config",
	config = config,
	dependencies = { "nvim-neo-tree/neo-tree.nvim" },
}
