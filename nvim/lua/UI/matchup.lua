-- Плагин для подсветки парных тегов и скобок
return {
	{
		"andymass/vim-matchup",
		event = "VeryLazy",
		config = function()
			vim.g.matchup_matchparen_enabled = 1
		end,
	},
}
