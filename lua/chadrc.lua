local M = {}

local highlights = require("highlights")

M.ui = {
	theme = "rosepine",
	hl_override = highlights.override,

	-- To fit with nvim-tree
	tabufline = {
		order = { "buffers", "tabs", "btns" }, -- Add "treeOffset" if you dont use nvimTreee like a popup
	},

	term = {
		-- hl = "Normal:term,WinSeparator:WinSeparator",
		-- sizes = { sp = 0.3, vsp = 0.2 },
		float = {
			relative = "editor",
			row = 0.1,
			col = 0.045,
			width = 0.9,
			height = 0.8,
			border = "single",
		},
	},
}

M.plugins = "plugins"

M.ui.nvdash = {
	load_on_startup = true,

	header = {
		"           ",
		"           ",
		"           ",
		"           ",
		"           ",
		"  ⟋|､      ",
		" (°､ ｡ 7   ",
		" |､  ~ヽ   ",
		" じしf_,)〳",
	},

	buttons = {
		{ "  Projects", "", "Telescope projects" },
		{ "  Themes  ", "", "Telescope themes" },
		{ "  Mappings", "", "NvCheatsheet" },
	},
}

M.disabled = {
	n = {
		["<leader>e"] = "",
	},
}

return M
