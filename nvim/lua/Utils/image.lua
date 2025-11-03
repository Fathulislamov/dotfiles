local exts = { "*.gif", "*.ico", "*.jpeg", "*.jpg", "*.png", "*.svg", "*.tiff", "*.webp", "*.bmp" }
return {
	"3rd/image.nvim",
	event = "BufRead",
	dependencies = {
		"vhyrro/luarocks.nvim",

		exts = "VeryLazy",
		priority = 1001, -- this plugin needs to run before anything else
		opts = {
			rocks = { "magick" },
		},
		config = true,
	},
}
