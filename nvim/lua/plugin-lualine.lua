-- Bubbles config for lualine

-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local hydra = require("hydra.statusline")
local colors = {
	blue    = '#80a0ff',
	cyan    = '#79dac8',
	black   = '#080808',
	white   = '#c6c6c6',
	red     = '#ff5189',
	violet  = '#d183e8',
	grey    = '#303030',
	bg_grey = '#1E1E1E',
	green   = '#228B22',
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
	if require 'lsp-status'.status() ~= '' then
--		return "lsp working"
		return '󰈖'
	end
	return "󰩋"
end

require('lualine').setup {
	options = {
		theme = bubbles_theme,
		component_separators = '|',
		section_separators = { left = '', right = '' },
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

		lualine_a = {
			{
				'mode',
				fmt = function(mode)
					if hydra.is_active() then
						mode = hydra.get_name()
					end
					return mode
				end,
				separator = { left = '' },
				right_padding = 2
			},
		},
		lualine_b = { 'filename', 'branch', },
		lualine_c = { lsp },
		lualine_x = {
			{
				'tabs',
				component_separators = { right = '', left = '' },
				section_separators = { left = '', right = '' },
				separator = { right = '', left = '' },
				tabs_color = {
					inactive = { fg = colors.white, bg = colors.grey },
					active = { fg = colors.black, bg = colors.blue },
				}
			},
			'%=                '
		},
		lualine_y = { 'filetype', { require 'lsp-status'.status() }, 'progress' },
		lualine_z = {
			{ 'location', separator = { right = '' }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = {
			{ 'filename', separator = { left = '' }, right_padding = 2 },
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {
			{ 'location', separator = { right = '' }, left_padding = 2 },
		},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}
