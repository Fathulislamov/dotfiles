return {
	'niuiic/code-shot.nvim',
	config = function()
		require("code-shot").setup({
			---@return string output file path
			output = function()
				local core = require("core")
				local buf_name = vim.api.nvim_buf_get_name(0)
				return core.file.name(buf_name) .. ".png"
			end,
			---@return string[]
			-- select_area: {start_line: number, end_line: number} | nil
			options = function(select_area)
				if not select_area then
					return {}
				end
				return {
					"--line-offset",
					select_area.start_line,
				}
			end,
		})
	end,
	dependencies = {
		'niuiic/core.nvim'
	}
}
