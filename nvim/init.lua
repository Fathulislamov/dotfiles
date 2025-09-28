local set = vim.opt -- Global/buffer/windows-scoped options
set.updatetime = 100 -- Set update time (need for lsp)
set.number = true -- Enable line numbering
set.tabstop = 2 -- Count spaces as tabs
set.shiftwidth = 2 -- Count spaces as autotabs
set.smarttab = true -- Tab == shiftwidth
set.expandtab = false -- Using spaces instead of tabs but no /t
set.swapfile = false -- Disable swap file creation
set.termguicolors = true -- Enable 24-bit colors
set.scrolloff = 8 -- Scroll offset
set.fillchars = { eob = " ", vert = " " } -- Hide ~ and window separator
set.ignorecase = true -- Ignore case
set.signcolumn = "no" -- Disable icons in column
set.mouse = "a" -- Enable mouse (visual mode)
set.showtabline = 0 -- Hide bufferline
set.clipboard = "unnamedplus" -- Global clipboard
set.undofile = true -- Enable support for undo files
set.undodir = os.getenv("HOME") .. "/.vim/undodir" --[[ Specify the path to the
																						directory for storing undo files ]]
set.title = true -- Set the terminal's title
vim.wo.wrap = false -- Disable line wrapping

require("Utils/lazy") -- Plugin manager

-- Set an 80 column border if open single buffer else hide column border
vim.api.nvim_create_autocmd({ "WinEnter", "WinLeave" }, {
	callback = function()
		local real_windows = 0
		local wins = vim.api.nvim_list_wins()

		for _, win in ipairs(wins) do
			local buf = vim.api.nvim_win_get_buf(win)
			local buf_type = vim.api.nvim_buf_get_option(buf, "buftype")
			local filetype = vim.api.nvim_buf_get_option(buf, "filetype")

			-- Игнорируем пустые буферы, NoNeckPain буферы и другие служебные
			if buf_type == "" and filetype ~= "NoNeckPain" then
				real_windows = real_windows + 1
			end
		end

		if real_windows > 1 then
			vim.wo.colorcolumn = ""
		else
			vim.wo.colorcolumn = "80"
		end
	end,
})
