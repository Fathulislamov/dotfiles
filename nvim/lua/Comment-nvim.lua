local function config()
	key = {
		['<leader>'] = {
			c = {
				name = "Comment",
				l = { 'Line-comment toggle keymap' },
				b = { 'Block-comment toggle keymap' },
				n = {
					name = 'Count comment',
					l = { 'Line-comment keymap' },
					b = { 'Block-comment keymap' },
					--c = { ' ' },
				},
				O = { 'Add comment on the line above' },
				o = { 'Add comment on the line below' },
				A = { 'Add comment at the end of line' },
			}
		}
	}

	which_key = require("which-key")
	which_key.register(key)
require('Comment').setup()
end

return {
	'numToStr/Comment.nvim',

	--config = config,
	 config = {
	},
	--	config = keymap,
	lazy = false,
}
