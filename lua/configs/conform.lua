local prettier = { "prettierd", "prettier", timeout_ms = 2000, stop_after_first = true }

local options = {
  default_format_opts = {
    lsp_format = "fallback",
  },

  formatters_by_ft = {
    lua = { "stylua", timeout_ms = 2000, stop_after_first = true },
    typescript = prettier,
    typescriptreact = prettier,
    javascript = prettier,
    javascriptreact = prettier,
    json = prettier,
    html = prettier,
    css = prettier,
    astro = prettier,
    tailwindcss = prettier,
  },
}

return options
