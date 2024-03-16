local gwidth = vim.api.nvim_list_uis()[1].width
local gheight = vim.api.nvim_list_uis()[1].height
local width = 60
local height = 40

return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = function(_, opts)
			opts.git.enable = true
			opts.actions.open_file.quit_on_open = true
			opts.filters.dotfiles = true
			opts.view.float = {
				enable = true,
				quit_on_focus_loss = true,
				open_win_config = {
					relative = "editor",
					width = width,
					height = height,
					row = (gheight - height) * 0.4,
					col = (gwidth - width) * 0.95,
					border = "rounded",
				},
			}
			opts.view.side = "right"
			opts.view.width = width
			opts.view.height = height
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim" },
		config = function()
			require("noice").setup({
				presets = {
					bottom_search = false, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
				lsp = {
					signature = {
						enabled = false,
					},
					hover = {
						enabled = false,
					},
				},
				progress = {
					enabled = false,
				},
				signature = { enabled = false },
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = false,
					["vim.lsp.util.stylize_markdown"] = false,
					["cmp.entry.get_documentation"] = false, -- requires hrsh7th/nvim-cmp
				},
			})
		end,
		init = function()
			vim.g.lsp_handlers_enabled = false
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
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"ray-x/lsp_signature.nvim",
			opts = {
				hint_enable = true, -- disable hints as it will crash in some terminal
			},
		},
	},

	-- Override plugin definition options
	{
		"nvim-treesitter/nvim-treesitter",
		opts = require("configs.treesitter"),
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
		},
	},
	{
		"williamboman/mason.nvim",
		opts = require("configs.mason"),
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig")
			require("configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},
	-- Better code action UI
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({})
		end,
	},
}
