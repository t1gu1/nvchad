local configs = require("nvchad.configs.lspconfig")
local servers = {
	html = {},
	cssls = {},
	tsserver = {},
	lua_ls = {},
	astro = {},
	tailwindcss = {},
	gdscript = {},
}

for server_name, server in pairs(servers) do
	server.on_init = configs.on_init
	server.on_attach = configs.on_attach
	server.capabilities = configs.capabilities
	require("lspconfig")[server_name].setup(server)
end
