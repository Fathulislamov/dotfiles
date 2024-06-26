local function conf()
	-- vim.cmd [[
	-- 	augroup kitty_mp
	--  			autocmd!
	--  		 	au VimLeave * :silent !kitty @ set-spacing padding=5 margin=0
	--   		au VimEnter * :silent !kitty @ set-spacing padding=0 margin=0
	-- 	augroup END
	-- ]]
	vim.cmd [[
		augroup kitty_mp
    	autocmd!
   		au VimLeave * :silent !kitty @ set-spacing padding=5  margin=0
    	au VimEnter * :silent !kitty @ set-spacing padding=0 margin=0
		augroup END
	]]

	vim.cmd("colorscheme codedark")
end

return {
	'tomasiser/vim-code-dark',
	init = conf
} -- Colorscheme
