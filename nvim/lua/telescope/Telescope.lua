local function config()
	local actions = require("telescope.actions")
	require("telescope").setup(
		{
			defaults = {
				theme = "center",
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.5,
					},
				},
				mappings = {
					i = {
						--["<esc>"] = actions.close,
						["<S-Q>"] = actions.close,
						["<S-j>"] = actions.move_selection_next,
						["<S-k>"] = actions.move_selection_previous,

					},
					n = {
						--		["<esc>"] = actions.close,
						--		["<CR>"] = actions.select_default,
						["h"] = actions.select_horizontal,
						["v"] = actions.select_vertical,
						--		["<C-t>"] = actions.select_tab,

						--		["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						--		["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,

						--		["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

						-- TODO: This would be weird if we switch the ordering.
						--		["j"] = actions.move_selection_next,
						--		["k"] = actions.move_selection_previous,
						--		["}"] = actions.move_to_top,
						--		["M"] = actions.move_to_middle,
						--		["{"] = actions.move_to_bottom,

						--		["<Down>"] = actions.move_selection_next,
						--		["<Up>"] = actions.move_selection_previous,
						--		["gg"] = actions.move_to_top,
						--		["G"] = actions.move_to_bottom,

						["K"] = actions.preview_scrolling_up,
						["J"] = actions.preview_scrolling_down,
						--["H"] = actions.preview_scrolling_left,
						--["L"] = actions.preview_scrolling_right,

						--		["<PageUp>"] = actions.results_scrolling_up,
						--		["<PageDown>"] = actions.results_scrolling_down,
						--	["<M-f>"] = actions.results_scrolling_left,
						--	["<M-k>"] = actions.results_scrolling_right,
						--
						--						["?"] = actions.which_key,
					}
				},
			},

			extensions = {
				media_files = {
					-- filetypes whitelist
					-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
					filetypes = { "png", "webp", "jpg", "jpeg", "svg" },
					-- find command (defaults to `fd`)
					--find_cmd = "rg"
				}
			},
		})
end
local function Keymap()
	local which_key = require("which-key")
	local keymap = {
		["<Leader>"] = {
			t = {
				name = "Telescope",
				f = { '<cmd>Telescope find_files<cr>', "Find files" },
				g = { '<cmd>Telescope live_grep<cr>', "Live grep" },
				b = { '<cmd>Telescope buffers initial_mode=normal<cr>', "Buffers" },
				t = { '<cmd>Telescope tags<cr>', "Tags" },
				s = { ':Telescope luasnip<cr>', 'Snippets' },
				p = { ':Telescope media_files initial_mode=normal<cr>', 'Preview image' },
				o = { '<cmd>Telescope oldfiles initial_mode=normal<cr>', "Oldfiles" },
				h = { '<cmd>Telescope help_tags initial_mode=normal<cr>', "Help tags" },
				m = { '<cmd>Telescope man_page initial_mode=normal<cr>', "Man" },
				l = { '<cmd>Telescope builtin initial_mode=normal<cr>', "Builtin" },
				--c = { '<cmd>Telescope command_history initial_mode=normal<cr>', "Builtin" },
			}
		}
	}
	which_key.register(keymap, { mode = { "n" } })
end

return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	config = config,
	opts = Keymap,
	dependencies = {
		require('telescope/Neoclip'),
		require('telescope/TelescopeLuasnip'),
		require('telescope/Media')
	}
} -- Fuzzy finder
