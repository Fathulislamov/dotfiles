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
set.cc = "80" -- Set an 80 column border for good coding style
set.undofile = true -- Enable support for undo files
set.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Specify the path to the directory for storing undo files
set.title = true -- Set the terminal's title
vim.wo.wrap = false -- Disable line wrapping

require("Utils/lazy") -- Plugin manager
