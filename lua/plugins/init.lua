-- User for NvimTree
local gwidth = vim.api.nvim_list_uis()[1].width
local gheight = vim.api.nvim_list_uis()[1].height
local width = 60
local height = 40

return {
	{ import = "nvchad.blink.lazyspec" },
	{
    "t1gu1/nvim-vtsls", event = "VeryLazy", lazy = true,
    config = function()
			require("vtsls").config({ silent = true })
		end
  },
	{
		event = "VeryLazy",
		"github/copilot.vim",
		config = function()
			vim.keymap.set("i", "<C-Space>", 'copilot#Accept("\\<CR>")', {
				expr = true,
				replace_keycodes = false,
			})
			vim.g.copilot_no_tab_map = true
		end,
	},
	{
		event = "VeryLazy",
		"f-person/git-blame.nvim",
		opts = {
			enabled = true,
			-- message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
			-- date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
			-- virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
		},
	},
	{
		"monkoose/DoNe",
		event = "VeryLazy",
		lazy = true,
		-- optional configuration
		config = function()
			-- as example adding some keybindings
			vim.keymap.set("n", "<F5>", "<Cmd>DoNe build<CR>")
			--- ...
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		event = "VeryLazy",
		branch = "main",
		dependencies = {
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			-- See Configuration section for options
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
	{
		"rmagatti/auto-session",
		lazy = false,

		---enables autocomplete for opts
		---@module "auto-session"
		opts = {
			enabled = true,
			auto_restore = true,
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			use_git_branch = true,
		},
	},
	-- Visual
	{
		event = "VeryLazy",
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"brenoprata10/nvim-highlight-colors",
		event = "VeryLazy",
		config = function()
			vim.opt.termguicolors = true

			require("nvim-highlight-colors").setup({
				enable_var_usage = false,
				-- Project color | TODO: Find a way to link/load that for a specefic project.

				-- !! PROMPT CHAT GPT !!
				-- Il faudra convertir l'objet json suivant: {PASTE json color du projet}
				-- Dans un format qui doit ressemble à l'exemple suivant: {PASTE custom_colors}
				-- Sort moi la liste complète et n'arrête pas tant que ce n'est pas terminé.

				custom_colors = {
					{ label = "bg%-accent", color = "#3D27C2FF" },
					{ label = "bg%-accent%-inverted", color = "#3D27C2FF" },
					{ label = "bg%-accent%-keep", color = "#3D27C2FF" },
					{ label = "bg%-accent%-keep%-inverted", color = "#3D27C2FF" },
					{ label = "bg%-elevated%-primary", color = "#FFFDF7FF" },
					{ label = "bg%-elevated%-primary%-inverted", color = "#19191CFF" },
					{ label = "bg%-elevated%-primary%-keep", color = "#FFFDF7FF" },
					{ label = "bg%-elevated%-primary%-keep%-inverted", color = "#19191CFF" },
					{ label = "bg%-elevated%-secondary", color = "#FFFBE9FF" },
					{ label = "bg%-elevated%-secondary%-inverted", color = "#1F1F25FF" },
					{ label = "bg%-elevated%-secondary%-keep", color = "#FFFBE9FF" },
					{ label = "bg%-elevated%-secondary%-keep%-inverted", color = "#1F1F25FF" },
					{ label = "bg%-elevated%-tertiary", color = "#FFFDF7FF" },
					{ label = "bg%-elevated%-tertiary%-inverted", color = "#26262EFF" },
					{ label = "bg%-elevated%-tertiary%-keep", color = "#FFFDF7FF" },
					{ label = "bg%-elevated%-tertiary%-keep%-inverted", color = "#26262EFF" },
					{ label = "bg%-primary", color = "#FFFDF7FF" },
					{ label = "bg%-primary%-inverted", color = "#131313FF" },
					{ label = "bg%-primary%-keep", color = "#FFFDF7FF" },
					{ label = "bg%-primary%-keep%-inverted", color = "#131313FF" },
					{ label = "bg%-secondary", color = "#FFFBE9FF" },
					{ label = "bg%-secondary%-inverted", color = "#19191CFF" },
					{ label = "bg%-secondary%-keep", color = "#FFFBE9FF" },
					{ label = "bg%-secondary%-keep%-inverted", color = "#19191CFF" },
					{ label = "bg%-tertiary", color = "#FFFDF7FF" },
					{ label = "bg%-tertiary%-inverted", color = "#1F1F25FF" },
					{ label = "bg%-tertiary%-keep", color = "#FFFDF7FF" },
					{ label = "bg%-tertiary%-keep%-inverted", color = "#1F1F25FF" },
					{ label = "border%-accent", color = "#3D27C2FF" },
					{ label = "border%-accent%-inverted", color = "#979DFFFF" },
					{ label = "border%-accent%-keep", color = "#3D27C2FF" },
					{ label = "border%-accent%-keep%-inverted", color = "#979DFFFF" },
					{ label = "border%-contrast%-max", color = "#131313FF" },
					{ label = "border%-contrast%-max%-2", color = "#131313FF" },
					{ label = "border%-contrast%-max%-2%-inverted", color = "#393A3FFF" },
					{ label = "border%-contrast%-max%-2%-keep", color = "#131313FF" },
					{ label = "border%-contrast%-max%-2%-keep%-inverted", color = "#393A3FFF" },
					{ label = "border%-contrast%-max%-inverted", color = "#FCFBFFFF" },
					{ label = "border%-contrast%-max%-keep", color = "#131313FF" },
					{ label = "border%-contrast%-max%-keep%-inverted", color = "#FCFBFFFF" },
					{ label = "border%-contrast%-mid", color = "#BBBAC1FF" },
					{ label = "border%-contrast%-mid%-inverted", color = "#5F606AFF" },
					{ label = "border%-contrast%-mid%-keep", color = "#BBBAC1FF" },
					{ label = "border%-contrast%-mid%-keep%-inverted", color = "#5F606AFF" },
					{ label = "border%-error", color = "#FF2123FF" },
					{ label = "border%-error%-inverted", color = "#FF7B6AFF" },
					{ label = "border%-error%-keep", color = "#FF2123FF" },
					{ label = "border%-error%-keep%-inverted", color = "#FF7B6AFF" },
					{ label = "border%-success", color = "#259E4DFF" },
					{ label = "border%-success%-inverted", color = "#62D37FFF" },
					{ label = "border%-success%-keep", color = "#259E4DFF" },
					{ label = "border%-success%-keep%-inverted", color = "#62D37FFF" },
					{ label = "btn%-primary", color = "#FFCD1FFF" },
					{ label = "btn%-primary%-disabled", color = "#BBBAC1FF" },
					{ label = "btn%-primary%-disabled%-inverted", color = "#6C6E79FF" },
					{ label = "btn%-primary%-disabled%-keep", color = "#BBBAC1FF" },
					{ label = "btn%-primary%-disabled%-keep%-inverted", color = "#6C6E79FF" },
					{ label = "btn%-primary%-hover", color = "#F8D477FF" },
					{ label = "btn%-primary%-hover%-inverted", color = "#F8D477FF" },
					{ label = "btn%-primary%-hover%-keep", color = "#F8D477FF" },
					{ label = "btn%-primary%-hover%-keep%-inverted", color = "#F8D477FF" },
					{ label = "btn%-primary%-inverted", color = "#F5C32CFF" },
					{ label = "btn%-primary%-keep", color = "#FFCD1FFF" },
					{ label = "btn%-primary%-keep%-inverted", color = "#F5C32CFF" },
					{ label = "btn%-primary%-pressed", color = "#F8D477FF" },
					{ label = "btn%-primary%-pressed%-inverted", color = "#F8D477FF" },
					{ label = "btn%-primary%-pressed%-keep", color = "#F8D477FF" },
					{ label = "btn%-primary%-pressed%-keep%-inverted", color = "#F8D477FF" },
					{ label = "btn%-secondary", color = "#3D27C2FF" },
					{ label = "btn%-secondary%-disabled", color = "#BBBAC1FF" },
					{ label = "btn%-secondary%-disabled%-inverted", color = "#6C6E79FF" },
					{ label = "btn%-secondary%-hover", color = "#3205ADFF" },
					{ label = "btn%-secondary%-hover%-inverted", color = "#3204AEFF" },
					{ label = "btn%-secondary%-pressed", color = "#3205ADFF" },
					{ label = "btn%-secondary%-pressed%-inverted", color = "#3204AEFF" },
					{ label = "ctn%-accent", color = "#514DD8FF" },
					{ label = "ctn%-accent%-2", color = "#D59856FF" },
					{ label = "ctn%-accent%-2%-inverted", color = "#D59856FF" },
					{ label = "ctn%-accent%-2%-keep", color = "#D59856FF" },
					{ label = "ctn%-accent%-2%-keep%-inverted", color = "#D59856FF" },
					{ label = "ctn%-accent%-3", color = "#FFEB9DFF" },
					{ label = "ctn%-accent%-3%-inverted", color = "#26262EFF" },
					{ label = "ctn%-accent%-3%-keep", color = "#FFEB9DFF" },
					{ label = "ctn%-accent%-3%-keep%-inverted", color = "#26262EFF" },
					{ label = "ctn%-accent%-inverted", color = "#3D27C2FF" },
					{ label = "ctn%-accent%-keep", color = "#3D27C2FF" },
					{ label = "ctn%-accent%-keep%-inverted", color = "#3D27C2FF" },
					{ label = "ctn%-error", color = "#FF2123FF" },
					{ label = "ctn%-error%-inverted", color = "#FF2123FF" },
					{ label = "ctn%-error%-keep", color = "#FF2123FF" },
					{ label = "ctn%-error%-keep%-inverted", color = "#FF2123FF" },
					{ label = "ctn%-error%-light", color = "#FFD9D1FF" },
					{ label = "ctn%-error%-light%-inverted", color = "#580204FF" },
					{ label = "ctn%-error%-light%-keep", color = "#FFD9D1FF" },
					{ label = "ctn%-error%-light%-keep%-inverted", color = "#580204FF" },
					{ label = "ctn%-neutral", color = "#E8E7F0FF" },
					{ label = "ctn%-neutral%-inverted", color = "#26262EFF" },
					{ label = "ctn%-neutral%-keep", color = "#E8E7F0FF" },
					{ label = "ctn%-neutral%-keep%-inverted", color = "#26262EFF" },
					{ label = "ctn%-success", color = "#57BC71FF" },
					{ label = "ctn%-success%-hard", color = "#08813AFF" },
					{ label = "ctn%-success%-hard%-inverted", color = "#62D37FFF" },
					{ label = "ctn%-success%-hard%-keep", color = "#08813AFF" },
					{ label = "ctn%-success%-hard%-keep%-inverted", color = "#62D37FFF" },
					{ label = "ctn%-success%-inverted", color = "#357C48FF" },
					{ label = "ctn%-success%-keep", color = "#57BC71FF" },
					{ label = "ctn%-success%-keep%-inverted", color = "#357C48FF" },
					{ label = "ctn%-warning", color = "#F76C14FF" },
					{ label = "ctn%-warning%-inverted", color = "#F76C14FF" },
					{ label = "ctn%-warning%-keep", color = "#F76C14FF" },
					{ label = "ctn%-warning%-keep%-inverted", color = "#F76C14FF" },
					{ label = "icon%-accent", color = "#3D27C2FF" },
					{ label = "icon%-accent%-inverted", color = "#979DFFFF" },
					{ label = "icon%-accent%-keep", color = "#3D27C2FF" },
					{ label = "icon%-accent%-keep%-inverted", color = "#979DFFFF" },
					{ label = "icon%-disable", color = "#8D8C91FF" },
					{ label = "icon%-disable%-inverted", color = "#47484FFF" },
					{ label = "icon%-disable%-keep", color = "#8D8C91FF" },
					{ label = "icon%-disable%-keep%-inverted", color = "#47484FFF" },
					{ label = "icon%-primary", color = "#131313FF" },
					{ label = "icon%-primary%-inverted", color = "#FCFBFFFF" },
					{ label = "icon%-primary%-keep", color = "#131313FF" },
					{ label = "icon%-primary%-keep%-inverted", color = "#FCFBFFFF" },
					{ label = "txt%-accent", color = "#3D27C2FF" },
					{ label = "txt%-accent%-inverted", color = "#979DFFFF" },
					{ label = "txt%-accent%-keep", color = "#3D27C2FF" },
					{ label = "txt%-accent%-keep%-inverted", color = "#979DFFFF" },
					{ label = "txt%-error", color = "#E20000FF" },
					{ label = "txt%-error%-inverted", color = "#FF7B6AFF" },
					{ label = "txt%-error%-keep", color = "#E20000FF" },
					{ label = "txt%-error%-keep%-inverted", color = "#FF7B6AFF" },
					{ label = "txt%-inactif", color = "#8D8C91FF" },
					{ label = "txt%-inactif%-inverted", color = "#47484FFF" },
					{ label = "txt%-inactif%-keep", color = "#8D8C91FF" },
					{ label = "txt%-inactif%-keep%-inverted", color = "#47484FFF" },
					{ label = "txt%-primary", color = "#131313FF" },
					{ label = "txt%-primary%-inverted", color = "#FCFBFFFF" },
					{ label = "txt%-primary%-keep", color = "#131313FF" },
					{ label = "txt%-primary%-keep%-inverted", color = "#FCFBFFFF" },
					{ label = "txt%-secondary", color = "#19191CFF" },
					{ label = "txt%-secondary%-inverted", color = "#E8E7F0FF" },
					{ label = "txt%-secondary%-keep", color = "#19191CFF" },
					{ label = "txt%-secondary%-keep%-inverted", color = "#E8E7F0FF" },
					{ label = "txt%-success", color = "#08813AFF" },
					{ label = "txt%-success%-inverted", color = "#62D37FFF" },
					{ label = "txt%-success%-keep", color = "#08813AFF" },
					{ label = "txt%-success%-keep%-inverted", color = "#62D37FFF" },
				},
			})
		end,
	},
	{
		event = "VeryLazy",
		"thenbe/markdown-todo.nvim",
		ft = { "md", "mdx", "markdown" },
		config = true,
	},
	{
		"nvim-tree/nvim-tree.lua",
		event = "VeryLazy",
		opts = function(_, opts)
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
			opts.filters = {}
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
		"jay-babu/project.nvim",
		main = "project_nvim",
		event = "VeryLazy",
		opts = { ignore_lsp = { "lua_ls" } },
	},

	-- Utils
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		opts = {
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
		},
		config = function()
			require("harpoon").setup()
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		keys = {
			{

				"<leader>a",
				function()
					local pipe = io.popen("git branch --show-current")
					repeat
						local c = pipe:read(4 * 1048576)
						if c then
							require("harpoon"):list(c):add()
						end
					until not c
					pipe:close()
				end,
				desc = "Harpoon - Add file related to current git branch",
			},
			{
				"<leader><leader>e",
				function()
					local pipe = io.popen("git branch --show-current")
					repeat
						local c = pipe:read(4 * 1048576)
						if c then
							require("harpoon").ui:toggle_quick_menu(require("harpoon"):list(c))
						end
					until not c
					pipe:close()
				end,
				desc = "Harpoon - Toggle quick menu related to current git branch",
			},
		},
	},
	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre', -- uncomment for format on save
		opts = require("configs.conform"),
	},
	{
		"NeogitOrg/neogit",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
			"echasnovski/mini.pick", -- optional
		},
		config = true,
	},
	{
		"luckasRanarison/tailwind-tools.nvim",
		event = "VeryLazy",
		opts = {
			document_color = {
				enabled = true,
				kind = "foreground",
				inline_symbol = "󰝤 ",
				debounce = 200,
			},
			conceal = {
				enabled = false,
				symbol = "󱏿",
				highlight = {
					fg = "#38BDF8",
				},
			},
		},
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		opts = {
			enable_autocmd = false,
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"luckasRanarison/tailwind-tools.nvim", -- TODO change for luckasRanarison/tailwind-tools.nvim
			"onsails/lspkind-nvim",
		},
		opts = function(_, opts)
			opts.formatting.format = require("lspkind").cmp_format({
				before = require("tailwind-tools.cmp").lspkind_format,
			})
		end,
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("mini.surround").setup({ n_lines = 260 })
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

	{
		"echasnovski/mini.move",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("mini.move").setup()
		end,
	},
	{
		"debugloop/telescope-undo.nvim",
		dependencies = { -- note how they're inverted to above example
			{
				"nvim-telescope/telescope.nvim",
				dependencies = { "nvim-lua/plenary.nvim" },
			},
		},
		keys = {
			{ -- lazy style key map
				"<leader>u",
				"<cmd>Telescope undo<cr>",
				desc = "undo history",
			},
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("undo")
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
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

	{
		"vuki656/package-info.nvim",
		event = "VeryLazy",
		config = function()
			local package_info = require("package-info")

			require("package-info").setup({
				colors = {
					up_to_date = "#3C4048", -- Text color for up to date dependency virtual text
					outdated = "#d19a66", -- Text color for outdated dependency virtual text
				},
				icons = {
					enable = true, -- Whether to display icons
					style = {
						up_to_date = "|  ", -- Icon for up to date dependencies
						outdated = "|  ", -- Icon for outdated dependencies
					},
				},
				autostart = true, -- Whether to autostart when `package.json` is opened
				hide_up_to_date = false, -- It hides up to date versions when displaying virtual text
				hide_unstable_versions = false, -- It hides unstable versions from version list e.g next-11.1.3-canary3
				-- Can be `npm`, `yarn`, or `pnpm`. Used for `delete`, `install` etc...
				-- The plugin will try to auto-detect the package manager based on
				-- `yarn.lock` or `package-lock.json`. If none are found it will use the
				-- provided one, if nothing is provided it will use `yarn`
				package_manager = "npm",
			})

			package_info.get_status()
		end,
	},
}
