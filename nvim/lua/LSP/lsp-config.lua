local function config()
	-- vim.diagnostic.config({
	-- 	float = { border = "rounded" },
	-- })

	-- Setup language servers.
	local lspconfig = require("lspconfig")
	lspconfig.ts_ls.setup({
		on_attach = function(client, bufnr)
			-- Включить inlay hints при подключении LSP
			vim.lsp.inlay_hint.enable(bufnr, true)
		end,
		settings = {
			typescript = {
				inlayHints = {
					includeInlayParameterNameHints = 'all',
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				}
			},
			javascript = {
				inlayHints = {
					includeInlayParameterNameHints = 'all',
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				}
			}
		},
		inlay_hints = {
      enabled = true,
    },
	})
	lspconfig.html.setup({})
	lspconfig.cssls.setup({})
	lspconfig.bashls.setup({})
	lspconfig.emmet_language_server.setup({})
	lspconfig.hyprls.setup({})
	lspconfig.lua_ls.setup({
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				hint = {
					enable = true,
				},
			},
		},
		inlay_hints = {
      enabled = true,
    },
	})
	lspconfig.tailwindcss.setup({})
	lspconfig.biome.setup({})

	local which_key = require("which-key")
	local keymap = {
		{ "<Leader>a",   group = "LSP" },
		{ "<Leader>aw",  group = "Workspace" },
		{ "<Leader>awa", vim.lsp.buf.add_workspace_folder, desc = "Add Folder" },
		{
			"<Leader>awr",
			vim.lsp.buf.remove_workspace_folder,
			desc = "Remove Folder",
		},
		{
			"<Leader>awl",
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			desc = "List Folders",
		},
		{
			"<Leader>af",
			function()
				vim.lsp.buf.format({ async = true })
			end,
			desc = "Format",
		},
		{ "<Leader>ad", group = "Diagnostic" },
		{
			"<Leader>adl",
			vim.diagnostic.setloclist,
			desc = "Diagnostic list",
		},
		{
			"<Leader>ado",
			vim.diagnostic.open_float,
			desc = "Open diagnostic float",
		},
		{ "<Leader>ag", group = "Go to" },
		{
			"<Leader>agi",
			vim.lsp.buf.implementation,
			desc = "Implementation",
		},
		{
			"<Leader>ags",
			vim.lsp.buf.signature_help,
			desc = "Signature Help",
		},
		{ "<Leader>agr", vim.lsp.buf.references,  desc = "References" },
		{ "<Leader>an",  desc = "References" },
		{ "<Leader>as",  desc = "Signature" },
		{ "<Leader>at",  desc = "Type definition" },
	}
	which_key.add(keymap)
end

return {
	"neovim/nvim-lspconfig",
	config = config,
}
