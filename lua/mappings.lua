require("nvchad.mappings")

-- Delete existing keymap
-- local unmap = vim.keymap.del
-- unmap("n", "<S-k>")

-- add yours here
local map = vim.keymap.set


-- Insert mode
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- Normal mode
map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("n", "<c-s>", '<cmd>lua require("conform").format()<CR>:w<CR>', { desc = "File Format with conform" })

map("n", "<leader>q", ":bdelete<cr>", { desc = "Buffer close" })

map("n", "p", '"0p', { desc = "paste after" })
map("n", "P", '"0P', { desc = "paste before" })

map("n", "d", '"_d', { desc = "Delete whithout remove yank" })
map("n", "D", '"_D', { desc = "Delete whithout remove yank" })
map("n", "c", '"_c', { desc = "Replace whithout remove yank" })

map("n", "<S-Up>", '<cmd>lua MiniMove.move_line("up")<cr>', { desc = "Move line up" })
map("n", "<S-Down>", '<cmd>lua MiniMove.move_line("down")<cr>', { desc = "Move line down" })
map("n", "<S-k>", '<cmd>lua MiniMove.move_line("up")<cr>', { desc = "Move line up" })
map("n", "<S-j>", '<cmd>lua MiniMove.move_line("down")<cr>', { desc = "Move line " })

-- Select mode
map("v", "d", '"_d', { desc = "Delete whithout remove yank" })
map("v", "D", '"_D', { desc = "Delete whithout remove yank" })

map("v", "<S-Up>", '<cmd>lua MiniMove.move_selection("up")<cr>', { desc = "Move selection up" })
map("v", "<S-Down>", '<cmd>lua MiniMove.move_selection("down")<cr>', { desc = "Move selection down" })
map("v", "<S-k>", '<cmd>lua MiniMove.move_selection("up")<cr>', { desc = "Move selection up" })
map("v", "<S-j>", '<cmd>lua MiniMove.move_selection("down")<cr>', { desc = "Move selection down" })
