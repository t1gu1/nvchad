require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
  callback = function()
    local main_lua = vim.fn.getcwd() .. "/main.lua"
    if vim.fn.filereadable(main_lua) == 1 then
      local lines = vim.fn.readfile(main_lua)
      for _, line in ipairs(lines) do
        if line:find("love%.") then
          local ok, love2d = pcall(require, "love2d")
          if ok then
            -- Didn't works without the defer..
            vim.defer_fn(function()
              love2d.setup()
            end, 1000)
          end
          return
        end
      end
    end
  end,
})

