local function config()
	require('autoclose').setup()
end

return {
	'm4xshen/autoclose.nvim',
	event = 'VeryLazy',
	config = config
}
