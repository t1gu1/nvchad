local map = vim.keymap.set
local configs = require("nvchad.configs.lspconfig")

-- local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
local servers = { "html", "cssls", "tsserver", "lua_ls", "astro", "gdscript" }

-- Copy the on_attach function: https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/lspconfig.lua
-- But I simply remove that line: map("n", "K", vim.lsp.buf.hover, opts "Lsp hover information")
local on_attach = function(client, bufnr)
	local function opts(desc)
		return { buffer = bufnr, desc = desc }
	end

	map("n", "gD", vim.lsp.buf.declaration, opts("Lsp Go to declaration"))
	map("n", "gd", vim.lsp.buf.definition, opts("Lsp Go to definition"))
	map("n", "gi", vim.lsp.buf.implementation, opts("Lsp Go to implementation"))
	map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Lsp Show signature help"))
	map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Lsp Add workspace folder"))
	map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Lsp Remove workspace folder"))

	map("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts("Lsp List workspace folders"))

	map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Lsp Go to type definition"))

	map("n", "<leader>ra", function()
		require("nvchad.lsp.renamer")()
	end, opts("Lsp NvRenamer"))

	map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Lsp Code action"))
	map("n", "gr", vim.lsp.buf.references, opts("Lsp Show references"))

	-- setup signature popup
	if conf.signature and client.server_capabilities.signatureHelpProvider then
		require("nvchad.lsp.signature").setup(client, bufnr)
	end
end

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
