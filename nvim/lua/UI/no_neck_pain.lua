local config = function()
	require("no-neck-pain").setup({
		width = 110,
		buffers = {
			right = {
				enabled = false,
			},
		},
		autocmds = {
			skipEnteringNoNeckPainBuffer = true,
			enableOnVimEnter = true,
			enableOnTabEnter = true,
		},
	})

	-- Функция для  закрытия Neotree
	vim.api.nvim_create_autocmd("VimEnter", {
		callback = function()
			vim.cmd("Neotree show")
			vim.defer_fn(function()
				require("neo-tree.command").execute({ action = "close" })
			end, 1)
		end,
	})
end

return {
	"shortcuts/no-neck-pain.nvim",
	-- version = "*",
	version = "v1.4.1",
	lazy = false,
	config = config,
}
