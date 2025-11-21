-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "rosepine",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    NvDashAscii = { bg = "NONE", fg = "yellow" },
    NvDashButtons = { bg = "NONE", fg = "red" },
    FoldColumn = { bg = "NONE" },
    LspReferenceRead = { link = "Underlined" },
    LspReferenceText = { link = "Underlined" },
    LspReferenceWrite = { link = "Underlined" },
    TblineFill = { link = "Normal" },
  },
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
    order = { "cwd", "git", "%=", "lsp_msg", "%=", "lsp" },
  },
}

M.nvdash = {
  load_on_startup = true,

  header = {
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
