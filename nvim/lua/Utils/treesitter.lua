local function config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
			"bash",
			"css",
			"diff",
			"dockerfile",
			"json",
			"javascript",
			"typescript",
			"tsx",
		},
		--- настройка автосворачивания
		highlight = { enable = true },
		indent = { enable = true },
		folding = {
			enable = true,
			disable = { "markdown" }, -- при необходимости исключите другие языки
			-- custom_foldtext = true, -- опционально: кастомизация отображения фолдов
			fold_virt_text = true,
			specific = {
				["tsx"] = {
					{ "import_statement", "type_alias_declaration", "interface_declaration" },
				},
			},
		},
		--
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = config,
}
