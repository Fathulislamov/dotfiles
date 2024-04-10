local function config()
	require("luasnip.loaders.from_vscode").lazy_load()

end
return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*",  -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	config = config,
	dependcies = {
		 'mlaursen/vim-react-snippets',
		'r5n-dev/vscode-react-javascript-snippets',
	}
}
