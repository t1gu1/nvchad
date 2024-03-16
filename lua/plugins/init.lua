return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},

	-- M.nvimtree = {
	-- 	git = { enable = true },
	-- 	actions = { open_file = { quit_on_open = true } }, -- NOTE: close when open file
	-- 	view = {
	-- 		width = 40,
	-- 		float = {
	-- 			enable = true,
	-- 			quit_on_focus_loss = true,
	-- 			open_win_config = {
	-- 				relative = "editor",
	-- 				border = "rounded",
	-- 				width = 40,
	-- 				-- height = 35,
	-- 				row = 1,
	-- 				col = 1,
	-- 			},
	-- 		},
	-- 	},
	-- 	renderer = {
	-- 		highlight_git = true,
	-- 		icons = { show = { git = true } },
	-- 		add_trailing = true,
	-- 		highlight_diagnostics = true,
	-- 	},
	-- 	filters = {
	-- 		git_ignored = true,
	-- 		dotfiles = true,
	-- 		git_clean = false,
	-- 		no_buffer = false,
	-- 		custom = {},
	-- 		exclude = {},
	-- 	},
	-- 	sort_by = "case_sensitive",
	-- }

	{
		"nvim-tree/nvim-tree.lua",
		-- config = function()
		-- 	require("nvim-tree").setup({
		-- 		view = {
		-- 			float = {
		-- 				quit_on_focus_loss = true,
		-- 			},
		-- 		},
		-- 	})
		-- end,
		opts = function(_, opts)
			opts.git.enable = true
			opts.actions.open_file.quit_on_open = true
			opts.view.side = "right"
		end,
	},
	{
		"jay-babu/project.nvim",
		main = "project_nvim",
		event = "VeryLazy",
		opts = { ignore_lsp = { "lua_ls" } },
	},
	{
		"nvim-telescope/telescope.nvim",
		optional = true,
		dependencies = { "jay-babu/project.nvim" },
		opts = function(_, opts)
			opts.patterns = { ".git" }
			require("telescope").load_extension("projects")
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		main = "rainbow-delimiters.setup",
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("mini.surround").setup()
		end,
	},
	{
		"echasnovski/mini.cursorword",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("mini.cursorword").setup()
		end,
	},
	-- {
	-- 	"echasnovski/mini.animate",
	-- 	event = "VeryLazy",
	-- 	version = "*",
	-- 	config = function()
	-- 		require("mini.animate").setup({
	-- 			cursor = { enable = false },
	-- 			scroll = { enable = true, timing = 51 },
	-- 			resize = { enable = true },
	-- 			open = { enable = true },
	-- 			close = { enable = true },
	-- 		})
	-- 	end,
	-- },
	{
		"echasnovski/mini.move",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("mini.move").setup()
		end,
	},
}
