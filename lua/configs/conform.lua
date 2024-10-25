local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },
		typescript = { { "prettierd", "prettier" } },
		typescriptreact = { { "prettierd", "prettier" } },
		javascript = { { "prettierd", "prettier" } },
		javascriptreact = { { "prettierd", "prettier" } },
		json = { { "prettierd", "prettier" } },
		html = { { "prettierd", "prettier" } },
		css = { { "prettierd", "prettier" } },
		astro = { { "prettierd", "prettier" } },
		tailwindcss = { { "prettierd", "prettier" } },
	},
}

return options
