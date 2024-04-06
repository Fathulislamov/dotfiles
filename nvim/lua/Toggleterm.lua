
--local which_key = require("which-key")
local keymap = {
	['<c-t>'] = { '<cmd>ToggleTerm<CR>', "Toggle terminal" },
}
-- which_key.register(keymap)
--which_key.register(keymap, { mode = { "n", "t" } })

return {
  {'akinsho/toggleterm.nvim', 
	version = "*", 
	opts = {--[[ things you want to change go here]]
	
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		else
			return 20
		end
	end,
	--  open_mapping = [[<leader>t]],
	--  on_open = function(t: Terminal), -- function to run when the terminal opens
	--  on_close = function (t: Terminal), -- function to run when the terminal closes
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 3,       -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
	start_in_insert = true,
	insert_mappings = true,   -- whether or not the open mapping applies in insert mode
	terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
	persist_size = true,
	direction = 'float',
	close_on_exit = true, -- close the terminal window when the process exits
	shell = vim.o.shell,  -- change the default shell
	-- This field is only relevant if direction is set to 'float'
	float_opts = {
		-- The border key is *almost* the same as 'nvim_open_win'
		-- see :h nvim_open_win for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		--    border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
		--    width = <value>,
		--    height = <value>,
		winblend = 3,
		highlights = {
			--border = "Normal",
			border = "rounded",
			background = "Normal",
		}
	}
}}
}

