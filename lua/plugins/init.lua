-- User for NvimTree
local gwidth = vim.api.nvim_list_uis()[1].width
local gheight = vim.api.nvim_list_uis()[1].height
local width = 70
local height = 45

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  -- Override plugin definition options
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
  },
  {
    "williamboman/mason.nvim",
    opts = require "configs.mason",
  },

  {
    "rmagatti/auto-session",
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    opts = {
      auto_restore = true,
      enabled = true,
      git_use_branch_name = true,
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    },
  },

  -- Visual
  { "tamton-aquib/keys.nvim" },
  {
    event = "VeryLazy",
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
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
      require("noice").setup {
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
      }
    end,
    init = function()
      vim.g.lsp_handlers_enabled = false
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

  -- Dashboard
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
      require("telescope").load_extension "projects"
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    main = "rainbow-delimiters.setup",
  },

  -- Code extra
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup()
      vim.diagnostic.config { virtual_text = false } -- Disable default virtual text
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
    "echasnovski/mini.surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.surround").setup { n_lines = 260 }
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

  -- Package version
  {
    "vuki656/package-info.nvim",
    event = "VeryLazy",
    config = function()
      local package_info = require "package-info"

      require("package-info").setup {
        highlights = {
          up_to_date = { fg = "#3C4048" },
          outdated = { fg = "#d19a66" },
          invalid = { fg = "#ee4b2b" },
        },
        icons = {
          enable = true, -- Whether to display icons
          style = {
            up_to_date = "|  ", -- Icon for up to date dependencies
            outdated = "|  ", -- Icon for outdated dependencies
            invalid = "|  ", -- Icon for invalid dependencies
          },
        },
        notifications = true, -- Whether to display notifications when running commands
        autostart = true, -- Whether to autostart when `package.json` is opened
        hide_up_to_date = false, -- It hides up to date versions when displaying virtual text
        hide_unstable_versions = false, -- It hides unstable versions from version list e.g next-11.1.3-canary3
        -- Can be `npm`, `yarn`, or `pnpm`. Used for `delete`, `install` etc...
        -- The plugin will try to auto-detect the package manager based on
        -- `yarn.lock` or `package-lock.json`. If none are found it will use the
        -- provided one, if nothing is provided it will use `yarn`
        package_manager = "npm",
      }

      package_info.get_status()
    end,
  },
  -- Endpoints list view
  {
    "zerochae/endpoint.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    cmd = { "Endpoint", "EndpointRefresh" },
    config = function()
      require("endpoint").setup {
        picker = {
          type = "telescope", -- "telescope", "vim_ui_select", "snacks"
        },
      }
    end,
  },
}
