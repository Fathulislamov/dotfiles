local function config()
	require("pantran").setup {
		-- Default engine to use for translation. To list valid engine names run
		-- `:lua =vim.tbl_keys(require("pantran.engines"))`.
		default_engine = "argos",
		ui = {
			width_percentage = 0.9,
			height_percentage = 0.7
		},


		-- Configuration for individual engines goes here.
		engines = {
			argos = {
				-- Default languages can be defined on a per engine basis. In this case
				-- `:lua require("pantran.async").run(function()
				-- vim.pretty_print(require("pantran.engines").yandex:languages()) end)`
				-- can be used to list available language identifiers.
				default_source = "en",
				default_target = "ru"
			},
		},
		controls = {
			mappings = {
				edit = {
					n = {
						-- Use this table to add additional mappings for the normal mode in
						-- the translation window. Either strings or function references are
						-- supported.
						["j"] = "gj",
						["k"] = "gk"
					},
					i = {
						-- Similar table but for insert mode. Using 'false' disables
						-- existing keybindings.
						["<C-y>"] = false,
						["<C-a>"] = require("pantran.ui.actions").yank_close_translation
					}
				},
				-- Keybindings here are used in the selection window.
				select = {
					n = {
						-- ...
					}
				}
			}
		}
	}


	local which_key = require("which-key")
	local keymap = {
		["<Leader>"] = {
			T = {
				t = {"<cmd>Pantran<CR>", "Translate"},
				h = 'g?',
			},

		}
	}
	which_key.register(keymap)
end
return {
	"potamides/pantran.nvim",
	event = "VeryLazy",
	config = config
}
