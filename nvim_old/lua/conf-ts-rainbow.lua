require("nvim-treesitter.configs").setup {
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
		colors = { 
        "#569CD6", 
        "#4EC9B0", 
        "#608B4E", 
        "#CE9178", 
        "#C586C0", 
        "#646695", 
        "#DCDCAA", 
    }, 
		-- colors = { 
  --       "#458588", 
  --       "#689d6a", 
  --       "#b16286", 
  --       "#d79921", 
  --       "#a89984", 
  --       "#a89984", 
  --       "#d65d0e", 
  --   }, 
    termcolors = { 
        -- "Green", 
        -- "Green", 
        -- "Yellow", 
        -- "Blue", 
        -- "Magenta", 
        -- "Cyan", 
        -- "White", 
    },
	}
}
