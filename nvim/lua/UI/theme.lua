local function conf()
	local cmd = vim.cmd
	cmd([[
		augroup kitty_mp
	    	autocmd!
	   		au VimLeave * :silent !kitty @ set-spacing padding=5  margin=0
	    	au VimEnter * :silent !kitty @ set-spacing padding=0 margin=0
		augroup END
		]])
	vim.schedule(function()
		--	cmd("set number! foldcolumn=1") -- Disable line-numbering
		--	cmd("set signcolumn=no")
		cmd("syntax on") -- Enable syntax highlighting
		cmd("syntax enable") -- Enable syntax highlighting

		cmd("highlight NormalFloat guibg=#1e1e1e")
		cmd("highlight WhichKeyNormal guibg=NvimDarkGrey1")
		cmd("highlight NeoTreeFloatTitle guibg=#1e1e1e")
		cmd("highlight LazyNormal guibg=NvimDarkGrey1")
		cmd("highlight MasonNormal guibg=NvimDarkGrey1")
		cmd("highlight WinSeparator  guifg=#1e1e1e")
	end)

	cmd("colorscheme codedark")
end

return {
	"tomasiser/vim-code-dark",
	init = conf,
}
