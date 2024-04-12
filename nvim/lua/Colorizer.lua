local function config()
	require 'colorizer'.setup(nil, { names = false, mode = 'foreground' })
end
return {
	'NvChad/nvim-colorizer.lua',
	event = 'VeryLazy',
	config = config
}
