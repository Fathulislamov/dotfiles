local config = function()
	local mc = require("multicursor-nvim")
	mc.setup()
	mc.addKeymapLayer(function(layerSet)
		layerSet("n", "<esc>", function()
			if not mc.cursorsEnabled() then
				mc.enableCursors()
			else
				mc.clearCursors()
			end
		end)
	end)

	local which_key = require("which-key")
	local key = {
		{ "<c-leftmouse>", ":lua require('multicursor-nvim').handleMouse()<CR>", desc = "Toggle cursor" },
	}
	which_key.add(key)
end

return {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	config = config,
}
