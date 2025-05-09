local M = {}
local highlights = require("highlights")

M.base46 = {
	theme = "rosepine",
	hl_override = highlights.override,
}

M.term = {
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
}

M.ui = {
	tabufline = {
		order = { "buffers", "tabs" }, -- Add "treeOffset" if you dont use nvimTreee like a popup
	},
	statusline = {
		separator_style = "block",
		order = { "cwd", "git", "%=", "lsp_msg", "%=", "lsp", "file" },
	},
}

M.nvdash = {
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
		"           ",
		"           ",
	},

	buttons = {
		{ txt = "  Projects", cmd = "Telescope projects" },
		{ txt = "  Themes  ", cmd = ":lua require('nvchad.themes').open()" },
		{ txt = "  Mappings", cmd = "NvCheatsheet" },
	},
}

return M
