return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
      opts.git.enable = true
      opts.actions.open_file.quit_on_open = true
    end,
  },
}
