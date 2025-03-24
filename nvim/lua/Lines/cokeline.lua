local function config()
	local is_picking_focus = require("cokeline.mappings").is_picking_focus
	local is_picking_close = require("cokeline.mappings").is_picking_close
	local get_hex = require("cokeline.hlgroups").get_hl_attr
	local background = get_hex("TabLineSel", "bg")
	local red = vim.g.terminal_color_1
	local yellow = vim.g.terminal_color_3

	require("cokeline").setup({
		default_hl = {
			fg = function(buffer)
				return buffer.is_focused and get_hex("Normal", "fg") or get_hex("Comment", "fg")
			end,
		},
		buffers = {
			focus_on_delete = "prev",
		},

		pick = {
			use_filename = true,
			letters = "asdfjkl;ghnmxcvbziowerutyqp",
		},

		fill_hl = "TabLineFill",
		components = {
			{
				text = "",
				fg = background,
				bg = get_hex("TabLineFill", "bg"),
			},
			{
				text = function(buffer)
					return (is_picking_focus() or is_picking_close()) and buffer.pick_letter .. " "
						or buffer.devicon.icon
				end,
				fg = function(buffer)
					return (is_picking_focus() and yellow) or (is_picking_close() and red) or buffer.devicon.color
				end,
				italic = function()
					return (is_picking_focus() or is_picking_close())
				end,
				bold = function()
					return (is_picking_focus() or is_picking_close())
				end,
			},
			{
				text = " ",
				bg = background,
			},
			{
				text = function(buffer)
					return buffer.filename .. "  "
				end,
				style = function(buffer)
					return buffer.is_focused and "bold" or nil
				end,
				bg = background,
			},
			{
				text = "",
				delete_buffer_on_left_click = true,
				bg = background,
				fg = "#ff6666",
			},
			{
				text = "",
				fg = get_hex("Normal", "bg"),
				bg = get_hex("TabLineFill", "bg"),
			},
			{
				text = " ",
				bg = get_hex("TabLineFill", "bg"),
			},
		},
		tabs = {
			placement = "right",
			components = {
				{
					text = function(TabPage)
						return TabPage.is_first and "" or " "
					end,
					fg = background,
					bg = function(TabPage)
						local bg = nil
						if TabPage.is_first then
							bg = get_hex("TabLineFill", "bg")
						else
							bg = background
						end
						return bg
					end,
				},
				{
					text = function(TabPage)
						return TabPage.number
					end,
					fg = function(TabPage)
						local fg = nil
						if TabPage.is_active then
							fg = get_hex("Normal", "fg")
						else
							fg = nil
						end
						return fg
					end,
					bg = background,
				},
				{
					text = function(TabPage)
						return TabPage.is_last and "" or ""
					end,
					fg = background,
					bg = function(TabPage)
						local bg = nil
						if TabPage.is_last then
							bg = get_hex("TabLineFill", "bg")
						else
							bg = background
						end
						return bg
					end,
				},
			},
		},
	})

	local which_key = require("which-key")
	local keymap = {
		{ "<Leader>F", "<Plug>(cokeline-pick-focus)", desc = "Pick focus" },
	}
	which_key.add(keymap)
end

return {
	"willothy/nvim-cokeline",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"stevearc/resession.nvim",
		require("Lines/tabscope"),
	},
	config = config,
}
