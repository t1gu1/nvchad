require "nvchad.mappings"

local map = vim.keymap.set

-- Project
map({ "n", "v" }, "<leader>qq", "<cmd>quit<CR>", { desc = "Quit the project" })
map("n", "<leader>sr", "<cmd>SessionRestore<cr>", { desc = "Buffer close" })
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Insert mode
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map("i", "jk", "<ESC>")

-- Search
map("n", "<leader>f<leader>", "<cmd>Telescope resume<cr>", { desc = "Buffer close" })
map(
  { "n", "v" },
  "<leader>fw",
  "<cmd>lua require('telescope.builtin').live_grep({ additional_args = { '--fixed-strings' }})<CR>",
  { desc = "Search a string" }
)

-- Explorer (Nvim Tree)
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })
map(
  "n",
  "<leader>E",
  "<cmd>NvimTreeToggle<cr><cmd>NvimTreeCollapse<cr>",
  { desc = "Toggle NvimTree to the project root" }
)

-- Terminal
map({ "n", "t" }, "<ESC>", "<cmd>close<cr>", { desc = "Close buffer" })
map({ "n" }, "t", "<cmd>Telescope terms<CR>", { desc = "Terminal List" })

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

-- Code actions
map({ "n", "i", "v" }, "<C-a>", "<ESC>ggVG", { desc = "Select ALL" })
map({ "n", "v" }, "<leader>la", "<cmd>Lspsaga code_action<CR>", { desc = "Lsp Code action" })
map("v", "d", '"_d', { desc = "Delete without remove yank" })
map("v", "D", '"_D', { desc = "Delete without remove yank" })
map("v", "p", '"_dP', { desc = "Paste without remove yank" })
map("v", "P", '"_dP', { desc = "Paste without remove yank" })
map("n", "<c-s>", function()
  require("conform").format()
  vim.cmd "w"
end, { desc = "Save file & file Format with conform", silent = true })

-- Code move a line
map("n", "<S-Up>", '<cmd>lua MiniMove.move_line("up")<cr>', { desc = "Move - line up" })
map("n", "<S-Down>", '<cmd>lua MiniMove.move_line("down")<cr>', { desc = "Move - line down" })
map("n", "<S-Left>", '<cmd>lua MiniMove.move_line("left")<cr>', { desc = "Move - line left" })
map("n", "<S-Right>", '<cmd>lua MiniMove.move_line("right")<cr>', { desc = "Move - line right" })
map("n", "<S-k>", '<cmd>lua MiniMove.move_line("up")<cr>', { desc = "Move - line up" })
map("n", "<S-j>", '<cmd>lua MiniMove.move_line("down")<cr>', { desc = "Move - line down" })
map("n", "<S-h>", '<cmd>lua MiniMove.move_line("left")<cr>', { desc = "Move - line left" })
map("n", "<S-l>", '<cmd>lua MiniMove.move_line("right")<cr>', { desc = "Move - line right" })
-- Code move bloc
map("v", "<S-Up>", '<cmd>lua MiniMove.move_selection("up")<cr>', { desc = "Move - line up" })
map("v", "<S-Down>", '<cmd>lua MiniMove.move_selection("down")<cr>', { desc = "Move - line down" })
map("v", "<S-Left>", '<cmd>lua MiniMove.move_selection("left")<cr>', { desc = "Move - line left" })
map("v", "<S-Right>", '<cmd>lua MiniMove.move_selection("right")<cr>', { desc = "Move - line right" })
map("v", "<S-k>", '<cmd>lua MiniMove.move_selection("up")<cr>', { desc = "Move - line up" })
map("v", "<S-j>", '<cmd>lua MiniMove.move_selection("down")<cr>', { desc = "Move - line down" })
map("v", "<S-h>", '<cmd>lua MiniMove.move_selection("left")<cr>', { desc = "Move - line left" })
map("v", "<S-l>", '<cmd>lua MiniMove.move_selection("right")<cr>', { desc = "Move - line right" })

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
  { desc = "Close Tabs to the right" }
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
