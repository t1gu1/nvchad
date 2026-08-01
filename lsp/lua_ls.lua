local love2d_root = vim.fn.stdpath("data") .. "/lazy/love2d.nvim"

return {
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { disable = { "duplicate-set-field" } },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME .. "/lua",
          vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
          "${3rd}/luv/library",
          love2d_root .. "/libraries/love2d/library",
          love2d_root .. "/libraries/luasocket/library",
        },
      },
    },
  },
}
