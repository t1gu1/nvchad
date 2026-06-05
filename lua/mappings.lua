require "nvchad.mappings"

local map = vim.keymap.set

-- Project
map({ "n", "v" }, "<leader>qq", "<cmd>quit<CR>", { desc = "Quit the project" })
map("n", "<leader>sr", "<cmd>SessionRestore<cr>", { desc = "Session restore" })
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Insert mode
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- Search
map("n", "<leader>f<leader>", "<cmd>Telescope resume<cr>", { desc = "Resume last Telescope search" })
map(
  { "n", "v" },
  "<leader>fw",
  "<cmd>lua require('telescope.builtin').live_grep({ additional_args = { '--fixed-strings' }})<CR>",
  { desc = "Search a string" }
)
map("n", "<leader>d/", "<cmd>noh<cr>", { desc = "Turn off highlighting until the next search" })

-- Explorer (Nvim Tree)
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })
map(
  "n",
  "<leader>E",
  "<cmd>NvimTreeToggle<cr><cmd>NvimTreeCollapse<cr>",
  { desc = "Toggle NvimTree to the project root" }
)

-- Terminal
map({ "n" }, "<ESC>", "<cmd>close<cr>", { desc = "Close buffer" })
map({ "t" }, "<ESC><ESC>", "<cmd>close<cr>", { desc = "Double ESC to close terminal buffer" })

local lastTermIdUsed = 1

map({ "n" }, "<leader>t", function()
  require("nvchad.term").toggle {
    pos = "float",
    id = lastTermIdUsed,
  }
end, { desc = "Terminal Toggle Floating" })

for id = 1, 9 do
  map({ "n" }, id .. "<leader>t", function()
    require("nvchad.term").toggle {
      pos = "float",
      id = id,
    }
    lastTermIdUsed = id
  end, { desc = "Terminal Toggle to " .. id })
end

-- Gemini Terminal
map({ "n" }, "<leader>ag", function()
  require("nvchad.term").toggle {
    pos = "float",
    id = "gemini",
    cmd = "gemini",
  }
end, { desc = "Gemini Toggle Floating" })

-- Claude
map({ "n" }, "<leader>aa", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude Code" })

--Copilot
map({ "n" }, "<leader>ac", function()
  require("nvchad.term").toggle {
    pos = "float",
    id = "copilot",
    cmd = "copilot",
  }
end, { desc = "Copilot Toggle Floating" })

map({ "n" }, "<leader>gg", function()
  require("nvchad.term").toggle {
    pos = "float",
    id = "lazygit",
    cmd = "lazygit",
  }
end, { desc = "Lazygit Toggle Floating" })

-- Code actions
map({ "n", "i", "v" }, "<C-a>", "<ESC>ggVG", { desc = "Select ALL" })
map({ "n", "v" }, "<leader>ca", function()
  require("fastaction").code_action()
end, { desc = "Lsp Code action" })

map("v", "d", '"_d', { desc = "Delete without remove yank" })
map("v", "D", '"_D', { desc = "Delete without remove yank" })
map("v", "p", '"_dP', { desc = "Paste without remove yank" })
map("v", "P", '"_dP', { desc = "Paste without remove yank" })
map("n", "<c-s>", function()
  require("conform").format()
  vim.cmd "w"
end, { desc = "Save file & file Format with conform", silent = true })

-- Code move a line (normal) / selection (visual)
local move_dirs = {
  { keys = { "<S-Up>", "<S-k>" }, dir = "up" },
  { keys = { "<S-Down>", "<S-j>" }, dir = "down" },
  { keys = { "<S-Left>", "<S-h>" }, dir = "left" },
  { keys = { "<S-Right>", "<S-l>" }, dir = "right" },
}

for _, m in ipairs(move_dirs) do
  for _, key in ipairs(m.keys) do
    map("n", key, string.format('<cmd>lua MiniMove.move_line("%s")<cr>', m.dir), { desc = "Move line " .. m.dir })
    map(
      "v",
      key,
      string.format('<cmd>lua MiniMove.move_selection("%s")<cr>', m.dir),
      { desc = "Move selection " .. m.dir }
    )
  end
end

-- Tabs manipulation
map(
  "n",
  "<leader>Q<Tab>",
  "<cmd>lua require('nvchad.tabufline').closeAllBufs(false)<cr>",
  { desc = "Close all buffers except the current one" }
)
map(
  { "n" },
  "<leader>q<tab>",
  "<cmd>lua require('nvchad.tabufline').close_buffer()<CR>",
  { desc = "Close current tab" }
)
map(
  { "n" },
  "<leader>c<tab>",
  "<cmd>lua require('nvchad.tabufline').closeBufs_at_direction('right')<CR>",
  { desc = "Close Tabs to the right" }
)
map(
  { "n" },
  "<leader>c<S-Tab>",
  "<cmd>lua require('nvchad.tabufline').closeBufs_at_direction('left')<CR>",
  { desc = "Close Tabs to the left" }
)
map(
  { "n", "v" },
  "<leader><tab>",
  "<cmd>lua require('nvchad.tabufline').move_buf(1)<CR>",
  { desc = "Move Tab by 1 to the right" }
)
map(
  { "n", "v" },
  "<leader><S-Tab>",
  "<cmd>lua require('nvchad.tabufline').move_buf(-1)<CR>",
  { desc = "Move Tab by 1 to the left" }
)
