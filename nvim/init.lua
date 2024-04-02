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
--set.mouse = "" -- Disable mouse
set.showtabline = 0 -- Hide bufferline
set.modifiable = true
vim.wo.wrap = false

cmd("set number! foldcolumn=1") -- Disable line-numbering
cmd("syntax on") -- Enable syntax highlighting
cmd("syntax enable") -- Enable syntax highlighting
cmd("set signcolumn=no")
--set.fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾'

require("plugin-lazy") -- Plugin manager
--cmd 'hi NormalFloat  guibg=transparent'

--cmd 'let g:codedark_modern=1	'
cmd("colorscheme codedark")
require("plugin-sfm") -- File manager
require("plugin-which-key") -- Keyboard sheet
require("plugin-auto-save") -- Auto save
require("plugin-hydra") -- hidra
require("plugin-lualine") -- Status bar
require("plugin-neoscroll") -- Smooth scroll
require("plugin-toggleterm") -- Terminal
require("plugin-noice") -- Completely replaces the UI
--require("plugin-treesitter") -- Highlighting
require("plugin-hop") -- Motion
require("plugin-lsp") -- Motion
require("plugin-mason") -- Mason
require("plugin-cmp") -- Autocompletion
require("plugin-pantran") -- Hydra
require("plugin-telescope") -- Fuzzy finder
require("plugin-comment") -- Comment
require("colorizer").setup() -- Highlighting color
require("confirm-quit").setup() -- Smart quit
require("autoclose").setup() -- Autopair
require("neoclip").setup() -- Clipboard
require("plugin-typescript-tools")
require("telescope").load_extension("media_files")
--require("lsp-status").config({})   -- Autopair
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		--		python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		typescriptreact = { { "prettierd", "prettier" } },
		css = { { "prettierd", "prettier" } },

		scss = { { "prettierd", "prettier" } },
	},
})
require("conform").formatters.injected = {
	-- Set the options field
	options = {
		-- Set to true to ignore errors
		ignore_errors = false,
		-- Map of treesitter language to file extension
		-- A temporary file name with this extension will be generated during formatting
		-- because some formatters care about the filename.
		lang_to_ext = {
			bash = "sh",
			c_sharp = "cs",
			elixir = "exs",
			javascript = "js",
			julia = "jl",
			latex = "tex",
			markdown = "md",
			python = "py",
			ruby = "rb",
			rust = "rs",
			teal = "tl",
			typescript = "ts",
		},
		-- Map of treesitter language to formatters to use
		-- (defaults to the value from formatters_by_ft)
		lang_to_formatters = {},
	},
}

require("conform").formatters.injected = {
	-- Set the options field
	options = {
		-- Use a specific prettier parser for a filetype
		-- Otherwise, prettier will try to infer the parser from the file name
		ft_parsers = {
			--     javascript = "babel",
			--     javascriptreact = "babel",
			--     typescript = "typescript",
			--     typescriptreact = "typescript",
			--     vue = "vue",
			--     css = "css",
			--     scss = "scss",
			--     less = "less",
			--     html = "html",
			--     json = "json",
			--     jsonc = "json",
			--     yaml = "yaml",
			--     markdown = "markdown",
			--     ["markdown.mdx"] = "mdx",
			--     graphql = "graphql",
			--     handlebars = "glimmer",
		},
		-- Use a specific prettier parser for a file extension
		ext_parsers = {
			-- qmd = "markdown",
		},
	},
}
cmd [[
augroup kitty_padding_color
    autocmd!
    au VimEnter * :silent !kitty @ set-colors background=\#1E1E1E
    au VimLeave * :silent !kitty @ set-colors background=\#000000
augroup END
]]

require("luasnip.loaders.from_vscode").lazy_load()
--require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./lua/snippets.json" } })
