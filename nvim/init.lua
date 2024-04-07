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
vim.wo.wrap = false

--cmd("set number! foldcolumn=1") -- Disable line-numbering
cmd("syntax on")                -- Enable syntax highlighting
cmd("syntax enable")            -- Enable syntax highlighting
cmd("set signcolumn=no")

require("Lazy")          -- Plugin manager
require("plugin-sfm")         -- File manager
--require("plugin-hydra")         -- hidra
--require("plugin-treesitter") -- Highlighting
--require("plugin-hop")           -- Motion
require("plugin-lsp")           -- Motion
require("plugin-mason")         -- Mason
require("plugin-cmp")           -- Autocompletion
--require("plugin-pantran")       -- Hydra
--require("plugin-telescope")     -- Fuzzy finder
--require("plugin-comment")       -- Comment
--require("colorizer").setup()    -- Highlighting color
--require("confirm-quit").setup() -- Smart quit
--require("autoclose").setup()    -- Autopair
--require("neoclip").setup()      -- Clipboard
--require("plugin-typescript-tools")
--require("telescope").load_extension("media_files")
--require("plugin-lazygit").setup()

--require("lsp-status").config({})   -- Autopair

cmd("colorscheme codedark")
cmd [[
augroup kitty_padding_color
    autocmd!
    au VimEnter * :silent !kitty @ set-colors background=\#1E1E1E
    au VimLeave * :silent !kitty @ set-colors background=\#000000
augroup END
]]

--require("luasnip.loaders.from_vscode").lazy_load()
--require('plugin-chatGPT')
--require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./lua/snippets.json" } })
require("keymap")          -- Plugin manager
