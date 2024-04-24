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
			hook = function()
				require('ts_context_commentstring').update_commentstring()
			end,
			--	}
		})
	end,
	dependencies = {
		'JoosepAlviste/nvim-ts-context-commentstring',
		config = function()
			require('ts_context_commentstring').setup {
				languages = {
					javascript = {
						__default = '// %s',
						jsx_element = '{/* %s */}',
						jsx_fragment = '{/* %s */}',
						jsx_attribute = '// %s',
						comment = '// %s',
					},
					typescript = { __default = '// %s', __multiline = '/* %s */' },
				},
			}
		end
	}

}
