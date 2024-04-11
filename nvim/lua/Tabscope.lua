local function config()
	-- Initialize tabscope
	require("tabscope").setup({})

	-- To remove tab local buffer, use remove_tab_buffer:
	vim.keymap.set("n", "<M-o>", require("tabscope").remove_tab_buffer)
end
return {
	'backdround/tabscope.nvim',
	config = config
}
