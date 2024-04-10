return {
	'terrortylor/nvim-comment',
	config = function()
		local which_key = require("which-key")
		local keymap = {
			["<Leader>"] = {
				c = { ":CommentToggle<cr>", "comment", mode = { 'n', 'v' } },
			}
		}
		which_key.register(keymap)
		require('nvim_comment').setup({
			-- Linters prefer comment and line to have a space in between markers
			--	 = {
			marker_padding = true,
			-- should comment out empty or whitespace only lines
			comment_empty = true,
			-- trim empty comment whitespace
			comment_empty_trim_whitespace = true,
			-- Should key mappings be created
			create_mappings = true,
			-- Normal mode mapping left hand side
			line_mapping = "gcl",
			-- Visual/Operator mapping left hand side
			operator_mapping = "gc",
			-- text object mapping, comment chunk,,
			comment_chunk_text_object = "ic",
			-- Hook function to call before commenting takes place
			hook = nil
			--	}
		})
	end
}
