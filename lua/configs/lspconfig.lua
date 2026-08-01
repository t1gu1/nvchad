require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "vtsls", "astro", "tailwindcss", "gdscript", "gopls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

-- Always expose LÖVE/LuaSocket type stubs to lua_ls. love2d.nvim also tries to
-- merge these in per-project, but that merge races against this eager config
-- and the plugin never notifies an already-running client, so it silently
-- loses. Statically including the library here works regardless of load order.
local love2d_root = vim.fn.stdpath "data" .. "/lazy/love2d.nvim"
local love2d_library = vim.list_slice(vim.lsp.config.lua_ls.settings.Lua.workspace.library)
vim.list_extend(love2d_library, {
  love2d_root .. "/libraries/love2d/library",
  love2d_root .. "/libraries/luasocket/library",
})
vim.lsp.config("lua_ls", {
  settings = { Lua = { workspace = { library = love2d_library } } },
})
