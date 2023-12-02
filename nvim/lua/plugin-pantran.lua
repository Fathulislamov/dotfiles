local pantran = require("pantran")
-- local actions = require("pantran.ui.actions")
-- local engines = require("pantran.engines")
-- local async = require("pantran.async")
-- async.run(function() print(vim.inspect(engines.google:languages())) end)
require("pantran").setup {
	-- Default engine to use for translation. To list valid engine names run
	-- `:lua =vim.tbl_keys(require("pantran.engines"))`.
	default_engine = "google",
	-- Configuration for individual engines goes here.
	engines = {
		google = {
			-- Default languages can be defined on a per engine basis. In this case
			-- `:lua require("pantran.async").run(function()
			-- vim.pretty_print(require("pantran.engines").yandex:languages()) end)`
			-- can be used to list available language identifiers.
			default_source = "en",
			default_target = "af",
			fallback = {
				default_source = "en",
				default_target = "ru",
			}
		},
	},
	controls = {
		mappings = {
			edit = {
				-- n = {
				-- 	-- Use this table to add additional mappings for the normal mode in
				-- 	-- the translation window. Either strings or function references are
				-- 	-- supported.
				-- 	["<C-l>"] = package.loaded.pantran.ui.actions.select_source,
				-- },
				-- i = {
				--   -- Similar table but for insert mode. Using 'false' disables
				--   -- existing keybindings.
				--   ["<C-y>"] = false,
				--   ["<C-a>"] = package.loaded.pantran.ui.actions.yank_close_translation
				-- }
			},
			-- -- Keybindings here are used in the selection window.
			-- select = {
			--   n = {
			--     -- ...
			--   }
			-- }
		}
	},

	window = {
		title_border = { " ", " " },
		window_config = {
			relative = "editor",
			border = "rounded",
		}
	}
}
local which_key = require("which-key")

local key = {
	["<Leader>"] = {
		t = { ':Pantran<CR>', "Translate" },
	}
}
which_key.register(key)
