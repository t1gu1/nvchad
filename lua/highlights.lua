local M = {}
-- local colors = require("base46").get_theme_tb "base_30"

M.override = {
	Comment = {
		italic = true,
	},
	-- Search = { fg = "black", bg = "blue" },
	-- IncSearch = { fg = "black", bg = "red" },
	-- CurSearch = { fg = "black", bg = "blue" },
	-- Substitute = { fg = "black", bg = "green" },
	NvDashAscii = { bg = "NONE", fg = "yellow" },
	NvDashButtons = { bg = "NONE", fg = "red" },
	FoldColumn = { bg = "NONE" },
	LspReferenceRead = { link = "Underlined" },
	LspReferenceText = { link = "Underlined" },
	LspReferenceWrite = { link = "Underlined" },
	TblineFill = { link = "Normal" },
}

return M
