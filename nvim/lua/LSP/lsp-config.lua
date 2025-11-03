local function config()
	-- vim.diagnostic.config({
	-- 	float = { border = "rounded" },
	-- vim.diagnostic.config({
	--   virtual_text = false,
	--   signs = true,
	--   update_in_insert = false,
	--   underline = true,
	-- })- })

	-- Setup language servers.
	--local lspconfig = require("lspconfig")
	local servers = {
		"html",
		"cssls",
		"bashls",
		"emmet_ls",
		"hyprls",
		"lua_ls",
		"ts_ls",
		"tailwindcss",
		"biome",
	}
	vim.lsp.config("*", {
		-- on_attach = on_attach,
		-- capabilities = capabilities,
		inlay_hints = {
			enabled = true,
		},
	})
	vim.lsp.enable(servers)
	-- , settings = { typescript = { inlayHints = { includeInlayParameterNameHints = 'all', includeInlayParameterNameHintsWhenArgumentMatchesName = true, includeInlayFunctionParameterTypeHints = true, includeInlayVariableTypeHints = true, includeInlayPropertyDeclarationTypeHints = true, includeInlayFunctionLikeReturnTypeHints = true, includeInlayEnumMemberValueHints = true, }, }, javascript = { inlayHints = { includeInlayParameterNameHints = 'all', includeInlayParameterNameHintsWhenArgumentMatchesName = true, includeInlayFunctionParameterTypeHints = true, includeInlayVariableTypeHints = true, includeInlayPropertyDeclarationTypeHints = true, includeInlayFunctionLikeReturnTypeHints = true, includeInlayEnumMemberValueHints = true, }, }, }, inlay_hints = { enabled = true, }, })
	local which_key = require("which-key")
	local keymap = {
		{ "<Leader>a", group = "LSP" },
		{ "<Leader>aw", group = "Workspace" },
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
		-- { "<Leader>agr", vim.lsp.buf.references,  desc = "References" },
		-- { "<Leader>an", desc = "References" },
		{ "<Leader>as", desc = "Signature" },
		{ "<Leader>at", desc = "Type definition" },
	}
	which_key.add(keymap)
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = config,
}
