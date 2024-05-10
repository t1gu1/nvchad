local configs = require("nvchad.configs.lspconfig")
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
		configs.on_attach(client, bufnr)

		-- Overwrite the "gd" keymap to remove the index.d.ts files from GD
		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition({ on_list = on_list })
		end, bufopts)
	end
	server.capabilities = configs.capabilities
	require("lspconfig")[server_name].setup(server)
end
