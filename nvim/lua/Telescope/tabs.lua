local function config()
	require("telescope").load_extension("telescope-tabs")
	require("telescope-tabs").setup({})

	local which_key = require("which-key")
	local keymap = {
		{ "<Leader>tt", ":Telescope telescope-tabs list_tabs<cr>", desc = "Tab list" },
	}
	which_key.add(keymap, { mode = { "n" } })
end

return {
	"LukasPietzschmann/telescope-tabs",
	config = config,
	dependencies = { "nvim-telescope/telescope.nvim" },
}
