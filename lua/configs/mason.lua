local options = {
	ensure_installed = {
		"lua-language-server",
		"stylua",
		"eslint_d",
		"jsonlint",
		"quick-lint-js",
		"fixjson",
		"prettierd",
		"luacheck",
		"stylua",
		"markdownlint",
	}, -- not an option from mason.nvim

	PATH = "skip",

	ui = {
		icons = {
			package_pending = " ",
			package_installed = "󰄳 ",
			package_uninstalled = " 󰚌",
		},

		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "x",
			cancel_installation = "<C-c>",
		},
	},

	max_concurrent_installers = 10,
}

return options
