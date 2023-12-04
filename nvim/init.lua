local cmd = vim.cmd           -- execute vim commands
local set = vim.opt           -- global/buffer/windows-scoped options
set.number = true             -- Enable line numbering

set.wrap = false              -- Not transfer skin
set.tabstop = 2               -- Tab width setting
set.shiftwidth = 2            -- Tab width setting
set.smarttab = true           -- Tab width setting
set.expandtab = false         -- Tab width setting
set.swapfile = false          -- Disable swap file creation
set.termguicolors = true      -- Sets 256 colors
--set.scrolloff = 8							-- Scroll offset
set.fillchars = { eob = ' ' } -- Hide ~set.showtabline = 0
set.mouse = ''                -- Disable mouse
--set.fillchars = { eob = ' ' }
cmd 'syntax on'               -- Enable syntax highlighting
cmd 'syntax enable'           -- Enable syntax highlighting
cmd 'set signcolumn=no'
--set.fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾'

require('plugin-lazy') -- Plugin manager
--cmd 'hi NormalFloat  guibg=transparent'

cmd 'colorscheme codedark'
require('plugin-sfm')        -- File manager
require('plugin-which-key')  -- Keyboard sheet
require('plugin-auto-save')  -- Auto save
require('plugin-hydra')      -- Hydra
require('plugin-lualine')    -- Status bar
require('plugin-neoscroll')  -- Smooth scroll
require('plugin-toggleterm') -- Terminal
require('plugin-noice')      -- Completely replaces the UI
require('plugin-treesitter') -- Highlighting
require('plugin-hop')        -- Motion
require('plugin-lsp')        -- Motion
require('plugin-mason')      -- Mason
require('plugin-cmp')        -- Autocompletion
require('plugin-pantran')    -- Hydra
require('plugin-telescope')  -- Fuzzy finder

cmd [[                           
augroup kitty_padding_color
    autocmd!
    au VimEnter * :silent !kitty @ set-colors background=\#1E1E1E
    au VimLeave * :silent !kitty @ set-colors background=\#000000
augroup END
]]
