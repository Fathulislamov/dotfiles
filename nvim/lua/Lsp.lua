local function config()
	--@diagnostic disable: undefined-global
	-- Setup language servers.
	local lspconfig = require('lspconfig')
	lspconfig.tsserver.setup {}
	lspconfig.html.setup {}
	lspconfig.cssls.setup {}
	lspconfig.prettier.setup {}
	lspconfig.prettierd.setup {}
	lspconfig.emmet_language_server.setup {}
	lspconfig.lua_ls.setup {
		settings = {
			Lua = {
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { 'vim' },
				},
			},
		},
	}
	-- LspInfoBorderxxx
	-- Global mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	vim.keymap.set('n', '<space>ado', vim.diagnostic.open_float)
	vim.keymap.set('n', '<space>adp', vim.diagnostic.goto_prev)
	vim.keymap.set('n', '<space>adn', vim.diagnostic.goto_next)
	vim.keymap.set('n', '<space>adl', vim.diagnostic.setloclist)

	-- Use LspAttach autocommand to only map the following keys
	-- after the language server attaches to the current buffer
	vim.api.nvim_create_autocmd('LspAttach', {
		group = vim.api.nvim_create_augroup('UserLspConfig', {}),
		callback = function(ev)
			-- Enable completion triggered by <c-x><c-o>
			vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf }
			vim.keymap.set('n', '<space>agD', vim.lsp.buf.declaration, opts)
			vim.keymap.set('n', '<space>agd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', '<space>ak', vim.lsp.buf.hover, opts)
			vim.keymap.set('n', '<space>agi', vim.lsp.buf.implementation, opts)
			vim.keymap.set('n', '<space>as', vim.lsp.buf.signature_help, opts)
			vim.keymap.set('n', '<space>awa', vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set('n', '<space>awr', vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set('n', '<space>awl', function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)
			vim.keymap.set('n', '<space>at', vim.lsp.buf.type_definition, opts)
			vim.keymap.set('n', '<space>ar', vim.lsp.buf.rename, opts)
			vim.keymap.set({ 'n', 'v' }, '<space>aa', vim.lsp.buf.code_action, opts)
			vim.keymap.set('n', '<space>agr', vim.lsp.buf.references, opts)
			vim.keymap.set('n', '<space>af', function()
				vim.lsp.buf.format { async = true }
			end, opts)
		end,
	})

	vim.diagnostic.config {
		float = { border = "rounded" },
	}

--	local which_key = require("which-key")
--	local keymap = {
--		["<Leader>"] = {
--			a = {
--				name = 'LSP',
--				d = {
--					name = 'Diagnostic',
--					o = 'Open diagnostic float',
--					p = 'Diagnostic previous',
--					n = 'Diagnostic next',
--					l = 'Diagnostic list',
--				},
--				g = {
--					name = 'Go to',
--					D = 'Declaration',
--					d = 'Definition',
--				},
--				k = 'Displays information under the cursor',
--				s = 'Signature',
--				w = {
--					name = 'Workspase',
--					a = 'Add folder',
--					r = 'Remove folder',
--					l = 'List folders',
--				},
--				t = 'Type definition',
--			r = 'Rename',
--				a = 'Code action',
--				n = 'References',
--				f = 'Format'
--			},
--		}
--	}
--	which_key.register(keymap)
end

return {
	 'neovim/nvim-lspconfig', -- LSP config
		config = config,
--	dependencies = {
		{ 'williamboman/mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim' },
		{ 'nvim-lua/lsp-status.nvim' }, -- Get stat us LSP
--	}
}
