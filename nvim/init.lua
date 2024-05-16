local cmd = vim.cmd           -- execute vim commands
local set = vim.opt           -- global/buffer/windows-scoped options
set.number = true             -- Enable line numbering
set.tabstop = 2               -- Tab width setting
set.shiftwidth = 2            -- Tab width setting
set.smarttab = true           -- Tab width setting
set.expandtab = false         -- Tab width setting
set.swapfile = false          -- Disable swap file creation
set.termguicolors = true      -- Sets 256 colors
set.scrolloff = 8             -- Scroll offset
set.fillchars = { eob = " " } -- Hide ~
--set.mouse = "" -- Disable mouse
set.showtabline = 0           -- Hide bufferline
set.modifiable = true
set.clipboard ="unnamedplus"  -- Global clipboard
-- set.timeoutlen = 1000         --time to wait for a mapped sequence to complete
vim.wo.wrap = false
vim.g.mapleader = " "
vim.g.maplocalleader = " "

cmd("set number! foldcolumn=1") -- Disable line-numbering
cmd("syntax on")                -- Enable syntax highlighting
cmd("syntax enable")            -- Enable syntax highlighting
cmd("set signcolumn=no")

require("Lazy")   -- Plugin manager
-- require("keymap") -- Keymap
