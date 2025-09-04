local function config()
	require("ts_context_commentstring").setup({
		enable_autocmd = false,
		languages = {
			javascript = {
				__default = "// %s",
				jsx_element = "{/* %s */}",
				jsx_fragment = "{/* %s */}",
				jsx_attribute = "// %s",
				comment = "// %s",
			},
			typescript = {
				__default = "// %s",
				jsx_element = "{/* %s */}",
				jsx_fragment = "{/* %s */}",
				jsx_attribute = "// %s",
				comment = "// %s",
				__multiline = "/* %s */",
			},
		},
	})

	require("nvim_comment").setup({
		create_mappings = false,
		hook = function()
			require("ts_context_commentstring").update_commentstring()
		end,
	})

	local which_key = require("which-key")
	local keymap = {
		{ "<Leader>c", ":CommentToggle<cr>", desc = "comment", mode = { "n", "v" } },
	}
	which_key.add(keymap)
end

return {
	"terrortylor/nvim-comment",
	config = config,
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
}
