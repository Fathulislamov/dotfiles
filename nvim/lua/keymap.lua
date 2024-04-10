
local which_key = require("which-key")
local key = {
	['<leader>'] = {
		l  = { '<c-w>l<cr>', "switch cursor right" },
		h  = { '<c-w>h<cr>', "switch cursor left" },
		j  = { '<c-w>j<cr>', "switch cursor down" },
		k  = { '<c-w>k<cr>', "switch cursor up" },
		n  = { ':tabnew <cr>', "open new tab" },
		dd = { '"_d<cr>', "delete" },
		s  = { '<esc>:w<cr>', "save" },
		ch = { ':nohlsearch<cr>', "clear the highlighting search" },
		m  = {
			name = "Move window",
			i = { '<c-w>r<cr>', "move window left" },
			o = { '<c-w>r<cr>', "move window right" },
		},
		o  = { '<c-o>', 'jump to older cursor position' },
		w  = { '<esc>:tabprevious <cr>', "tab previous" },
		r  = { '<esc>:tabnext <cr>', "tab next" },
		u  = { '<esc>:set number!<cr>', "toggle line-numbering" },
	},
	['<F10>'] = { ':lua sourceAllConfigFiles()<CR>', 'Source all config files' },
}
which_key.register(key)

function sourceAllConfigFiles()
	local function ConfigFiles(folder_path)
		local filenames = vim.fn.glob(folder_path .. "/*", true, true)
		for _, filename in ipairs(filenames) do
			if vim.fn.isdirectory(filename) == 1 then -- если элемент является папкой
				ConfigFiles(filename)      -- вызываем функцию рекурсивно для этой папки
			else
				vim.cmd(":source " .. filename)
			end
		end
	end

	ConfigFiles(vim.fn.expand("~/.config/nvim/lua"))
end
