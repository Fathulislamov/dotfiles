local config = function()
	local conform = require("conform")
	conform.setup({
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			css = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			json = { "prettierd", "prettier", stop_after_first = true },
			-- javascript = { "biome" },
			-- typescript = { "biome" },
			-- javascriptreact = { "biome" },
			-- typescriptreact = { "biome" },
			-- css = { "biome" },
			-- html = { "biome" },
			-- json = { "biome" },
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 500,
		},
		formatters = {
			biome = {
				command = "biome",
				args = {
					"check",
					"--formatter-enabled=true",
					"--linter-enabled=false",
					"--organize-imports-enabled=true",
					"--write",
					"--stdin-file-path",
					"$FILENAME",
				},
			},
		},
	})

	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function(args)
			require("conform").format({ bufnr = args.buf })
		end,
	})
end

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo" },
	config = config,
}
