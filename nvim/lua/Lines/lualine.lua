local colors = {
	blue = "#80a0ff",
	cyan = "#79dac8",
	black = "#080808",
	white = "#c6c6c6",
	red = "#ff5189",
	violet = "#d183e8",
	grey = "#303030",
	bg_grey = "#1E1E1E",
	green = "#228B22",
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.blue },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.white, bg = colors.grey },
	},
	insert = { a = { fg = colors.black, bg = colors.green } },
	visual = { a = { fg = colors.black, bg = colors.cyan } },
	replace = { a = { fg = colors.black, bg = colors.red } },
	inactive = {
		a = { fg = colors.white, bg = colors.grey },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.black, bg = colors.grey },
	},
}

local function lsp()
	local status, lsp_status = pcall(require, "lsp-status")
	if status and lsp_status.status() ~= "" then
		return "󰈖"
	else
		return "󰩋"
	end
end

local config = function()
	require("lualine").setup({
		options = {
			theme = bubbles_theme,
			component_separators = "|",
			section_separators = { left = "", right = "" },
			--	ignore_focus = { 'sfm' },
			--		disabled_filetypes = { 'packer', 'NvimTree' },
			globalstatus = true,
			use_mode_colors = true,
			refresh = {
				statusline = 500,
				tabline = 1000,
				winbar = 1000,
			},
			always_divide_middle = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "filename", "branch" },
			lualine_c = { lsp, "diagnostics" },
			lualine_x = { "ctime" },
			lualine_y = {},
			lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
		},
		-- inactive_sections = {
		-- 	lualine_a = {},
		-- 	lualine_b = {},
		-- 	lualine_c = {},
		-- 	lualine_x = {},
		-- 	lualine_y = {},
		-- 	lualine_z = {},
		-- },
		-- tabline = {},
		-- winbar = {},
		-- inactive_winbar = {},
		-- extensions = {},
	})
end
return {
	"nvim-lualine/lualine.nvim",
	config = config,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"archibate/lualine-time",
		"nvimdev/lspsaga.nvim",
	},
}
