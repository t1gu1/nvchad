local options = {
	default_format_opts = {
		lsp_format = "fallback",
	},

	formatters_by_ft = {
		lua = { "stylua", timeout_ms = 2000, stop_after_first = true },
		typescript = {
			"prettierd",
			"prettier",
			timeout_ms = 2000,
			stop_after_first = true,
		},
		typescriptreact = { "prettierd", "prettier", timeout_ms = 2000, stop_after_first = true },
		javascript = {
			"prettierd",
			"prettier",
			timeout_ms = 2000,
			stop_after_first = true,
		},
		javascriptreact = { "prettierd", "prettier", timeout_ms = 2000, stop_after_first = true },
		json = { "prettierd", "prettier", timeout_ms = 2000, stop_after_first = true },
		html = { "prettierd", "prettier", timeout_ms = 2000, stop_after_first = true },
		css = { "prettierd", "prettier", timeout_ms = 2000, stop_after_first = true },
		astro = { "prettierd", "prettier", timeout_ms = 2000, stop_after_first = true },
		tailwindcss = { "prettierd", "prettier", timeout_ms = 2000, stop_after_first = true },
	},
}

return options
