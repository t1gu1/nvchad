local M = {}

local highlights = require "highlights"

M.ui = {
  theme = "rosepine",
  hl_override = highlights.override,
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

return M
