vim.schedule(function()
	require("Key/keymap")
end)

return {
	require("Key/confirm-quit"),
	require("Key/hop"),
	require("Key/multicursor"),
	require("Key/whichkey"),
}
