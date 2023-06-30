-- Setup nvim-cmp.
local cmp = require 'cmp'
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		completion = { -- rounded border; thin-style scrollbar
			border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
			winhighlight = 'Normal:CmpPmenuBorder,FloatBorder:NONE,CursorLine:PmenuSel,Search:NONE',
		},
		documentation = { -- no border; native-style scrollbar
			border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
			winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
		},
	},

	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- For vsnip users.
		{ name = 'treesitter' },
		{ name = 'buffer' },
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = 'buffer' },
	})
})


-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' }
	-- }, {
-- 		{ name = 'cmdline' }
	})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig').clangd.setup {
	capabilities = capabilities
}


local which_key = require("which-key")

local keymap = {
	name = "Auto complete",
	["<C-k>"] = { "select prev item" },
	["<C-j>"] = { "select next item" },
	['<C-b>'] = { "scroll docs" },
	['<C-f>'] = { "scroll docs" },
	['<C-Space>'] = { "complete" },
	['<C-e>'] = { "abort" },
	['<CR>'] = { "confirm" },
}
which_key.register(keymap, { prefix = "<C>" })
