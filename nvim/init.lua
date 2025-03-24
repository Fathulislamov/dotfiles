local cmd = vim.cmd -- execute vim commands
local set = vim.opt -- global/buffer/windows-scoped options

set.number = true -- Enable line numbering
set.tabstop = 2 -- Tab width setting
set.shiftwidth = 2 -- Tab width setting
set.smarttab = true -- Tab width setting
set.expandtab = false -- Tab width setting
set.swapfile = false -- Disable swap file creation
set.termguicolors = true -- Sets 256 colors
set.scrolloff = 8 -- Scroll offset
set.fillchars = { eob = " " } -- Hide ~
set.ignorecase = true -- Ignore case
set.signcolumn = "no"
--set.mouse = "" -- Disable mouse
set.showtabline = 0 -- Hide bufferline
set.modifiable = true
-- set.clipboard = "unnamedplus" -- Global clipboard
-- set.cc = "80" -- set an 80 column border for good coding style
-- set.timeoutlen = 1000         --time to wait for a mapped sequence to complete
set.undofile = true -- Enable support for undo files
set.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Specify the path to the directory for storing undo files
set.undolevels = 1000 -- Set the maximum number of undo levels
set.undoreload = 10000 -- Set the maximum number of lines for reloading
vim.wo.wrap = false

vim.schedule(function()
	cmd("autocmd BufEnter * set fo-=c")
	--	cmd("set number! foldcolumn=1") -- Disable line-numbering
	--	cmd("syntax on")    -- Enable syntax highlighting
	--	cmd("syntax enable") -- Enable syntax highlighting
	--cmd("set signcolumn=no")
end)

require("Utils/lazy") -- Plugin manager
