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
		['?'] = { 'Help',
			e = {
				name = 'File manager',
				q = 'Close the explorer window',
				['<Esc>'] = 'Close the explorer window',
				v = 'Open a file in a vertical split window',
				h = 'Open a file in a horizontal split window',
				['<C-t>'] = 'Open a file in a new tab',
				x = 'Close current opened directory or parent',
				K = 'Navigate to the first sibling of current file or directory',
				J = 'Navigate to the last sibling of current file or directory',
				P = 'Move cursor to the parent directory',
				['<C-]>'] = 'Change the root directory to the parent directory of the current root',
				[']'] = 'Change the root directory to the current folder entry or to the parent directory of the current file entry',
				R = 'Reload the explorer',
				n = 'Create a new file/directory in the current folder',
				c = 'Copy the current file or directory to a destination path specified by the user',
				p = 'Copy all selected files or directories to the current folder',
				r = 'Move/rename the current file or directory',
				x = 'Move all selected files or directories to the current folder',
				dd = 'Delete the current file or directory',
				ds = 'Delete all selected files or directories',
				['<Space>'] = 'Toggle the selection of the current file or directory',
				['<C-Space>'] = 'Clear all selections',
			},
		},
	}
}
which_key.register(key)
