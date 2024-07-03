local configs = require("nvchad.configs.lspconfig")
local M = {}
local servers = {
	html = {},
	cssls = {},
	tsserver = {},
	lua_ls = {},
	astro = {},
	tailwindcss = {},
	gdscript = {},
	gopls = {},
}
local map = vim.keymap.set

-- Base on the nvcahd one here (But I love to be able to overite mapping): https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/lspconfig.lua
M.on_attach = function(_, bufnr)
	local function opts(desc)
		return { buffer = bufnr, desc = "LSP " .. desc }
	end

	map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
	map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
	map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
	map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
	map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

	map("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts("List workspace folders"))

	map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))

	map("n", "<leader>ra", function()
		require("nvchad.lsp.renamer")()
	end, opts("NvRenamer"))

	map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
	map("n", "gr", vim.lsp.buf.references, opts("Show references"))
end

-- Utils functions to redefine the "gd" function to remove the index.d.ts files from GD
local function filter(arr, fn)
	if type(arr) ~= "table" then
		return arr
	end

	local filtered = {}
	for k, v in pairs(arr) do
		if fn(v, k, arr) then
			table.insert(filtered, v)
		end
	end

	return filtered
end

local function filterReactDTS(value)
	return string.match(value.filename, "index.d.ts") == nil
end

local function on_list(options)
	local items = options.items
	if #items > 1 then
		items = filter(items, filterReactDTS)
	end

	vim.fn.setqflist({}, " ", { title = options.title, items = items, context = options.context })
	vim.api.nvim_command("cfirst") -- or maybe you want 'copen' instead of 'cfirst'
end

-- init & attache & config LSP things
for server_name, server in pairs(servers) do
	server.on_init = configs.on_init
	server.on_attach = function(client, bufnr)
		-- Apply the nvchad on_attach
		M.on_attach(client, bufnr)

		-- Overwrite the "gd" keymap to remove the index.d.ts files from GD
		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		map("n", "gd", function()
			vim.lsp.buf.definition({ on_list = on_list })
		end, bufopts)
	end
	server.capabilities = configs.capabilities
	require("lspconfig")[server_name].setup(server)
end
