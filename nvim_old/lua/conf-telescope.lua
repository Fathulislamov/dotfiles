local builtin = require('telescope.builtin')
--vim.keymap.set('n', 'ff', builtin.find_files, {})
--vim.keymap.set('n', 'fg', builtin.live_grep, {})
--vim.keymap.set('n', 'fb', builtin.buffers, {})
--vim.keymap.set('n', 'fh', builtin.help_tags, {})


local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<S-j>"] = actions.move_selection_next,
      	["<S-k>"] = actions.move_selection_previous,
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

local which_key = require("which-key")
local key = {
	["<Leader>"] = {
		f = {
			name = "Telescope", 
			f = {'<cmd>Telescope find_files<CR>', "Find files"},
			g = {'<cmd>Telescope live_grep<CR>', "Live grep"},
			b = {'<cmd>Telescope buffers<CR>', "Find buffers"},
			h = {'<cmd>Telescope help_tags<CR>', "Help tags"},
			["<S-j>"] = {'Move selection next'},
      ["<S-k>"] = {'Move selection previous'},
		}	
	}
}
which_key.register(key)
