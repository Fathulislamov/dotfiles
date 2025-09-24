local function conf()
	local cmd = vim.cmd
	-- cmd("highlight NormalFloat guibg=#1e1e1e")
	cmd("highlight WhichKeyNormal guibg=NvimDarkGrey1")
	-- 	cmd("highlight NeoTreeFloatTitle guibg=#1e1e1e")
	-- cmd("highlight LazyNormal guibg=NvimDarkGrey1")
	-- 	cmd("highlight MasonNormal guibg=NvimDarkGrey1")
	-- cmd("highlight WinSeparator  guifg=#1e1e1e")
	-- end)
	--
	cmd("colorscheme arctic")
end

return {
	"rockyzhang24/arctic.nvim",
	branch = "v2",
	dependencies = { "rktjmp/lush.nvim" },
	init = conf,
}
