local options = {
  auto_install = true,

  ensure_installed = {
    "vtsls",
    "prettierd",
    "eslint_d",
    "lua-language-server",
    "jsonlint",
    "stylua",
    "fixjson",
    "quick-lint-js",
    "luacheck",
    "astro-language-server",
    "markdownlint",
    "tailwindcss-language-server",
    "gopls",
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
