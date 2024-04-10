local function conf()
	vim.cmd [[
			augroup kitty_padding_color
   			autocmd!
    		au VimEnter * :silent !kitty @ set-colors background=\#1E1E1E
   		 au VimLeave * :silent !kitty @ set-colors background=\#000000
			augroup END
		]]

	vim.cmd("colorscheme codedark")
end
return {
	'tomasiser/vim-code-dark',
	init = conf

} -- Colorscheme
