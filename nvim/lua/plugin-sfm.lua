local default_config = {
	view = {
		side = "left", -- side of the tree, can be `left`, `right`. this setting will be ignored if view.float.enable is set to true, width = 30, -- this setting will be ignored if view.float.enable is set to true,
		float = {
			enable = true,
			config = {
				relative = "editor",
				border = "rounded",
				width = math.floor(vim.o.columns * 0.5),
				height = math.floor(vim.o.lines * 0.8), -- int or function
				row = math.floor(vim.o.lines * 0.1), --int or function
				col = math.floor((vim.o.columns - math.floor(vim.o.columns * 0.5)) / 2)
			}
		}
	},
	mappings = {
		custom_only = false,
		list = {
			{
				key = "v",
				--action = {'vsplit', 'close'},
				action = 'vsplit',
				--action = 'close',
				--action = function()
				--end,
			},
			{
				key = "h",
				action = "split",
			},
			{
			key = "x",
				action = "close_entry",
			},
			{
				key = "<Esc>",
				action = "close",
			},
			{
				key = "r",
				action = "move",
			},
			{
				key = '<Space>',
				action = "",
			},

		}
	},
	renderer = {
		icons = {
			file = {
				default = "",
				symlink = "",
			},
			folder = {
				default = "",
				open = "",
				symlink = "",
				symlink_open = "",
			},
			indicator = {
				folder_closed = "",
				folder_open = "",
				file = " ",
			}
		}
	}
}


local sfm_explorer = require("sfm").setup(default_config)
sfm_explorer:subscribe('FileOpened', function(payload)
	local api = require('sfm.api')
	api.explorer.close()
end)

vim.cmd 'highlight SFMFileName guibg=none'

local which_key = require("which-key")

local key = {
	["<Leader>"] = {
		e = { ':SFMToggle<CR>', "File manager", },
		E = {
			'File manager help',
			q = 'Close the explorer ',
			['<Esc>'] = 'Close the explorer ',
			v = 'Open a file in a vertical split ',
			h = 'Open a file in a horizontal split ',
			['<C-t>'] = 'Open a file in a new tab',
			x = 'Close current opened diror parent',
			K = 'Navigate to the start list',
			J = 'Navigate to the end list',
			P = 'Move cursor to the parent dir',
			['<C-]>'] = 'Change dir to the current root',
			[']'] = 'Change dir to the parent root', -- to the	current folder entry or to the parent directory of the current file entry
			R = 'Reload the explorer',
			n = 'Create a new file/dir',
			c = 'Copy the current file or dir',
			p = 'Copy all selected files or dir',
			r = 'Move/rename the current file or dir',
			x = 'Move all selected files or dir',
			dd = 'Delete the current file or dir',
			ds = 'Delete all selected files or dir',
			['<Space>'] = 'Toggle the selection item',
			['<C-Space>'] = 'Clear all selections',
		},
	}
}
which_key.register(key)
