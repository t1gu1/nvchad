require("nvchad.mappings")

-- add yours here
local map = vim.keymap.set

-- Insert mode
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- Normal mode
map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("n", "<ESC>", "<cmd>q<cr>", { desc = "Close buffer" })
map("n", "<leader>q", ":bdelete<cr>", { desc = "Buffer close" })

map("n", "<c-s>", '<cmd>lua require("conform").format()<CR>:w<CR>', { desc = "File Format with conform" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })

map("n", "p", '"0p', { desc = "Paste after" })
map("n", "P", '"0P', { desc = "Paste before" })

map("n", "d", '"_d', { desc = "Delete whithout remove yank" })
map("n", "D", '"_D', { desc = "Delete whithout remove yank" })
map("n", "c", '"_c', { desc = "Replace whithout remove yank" })

map("n", "<S-Up>", '<cmd>lua MiniMove.move_line("up")<cr>', { desc = "Move line up" })
map("n", "<S-Down>", '<cmd>lua MiniMove.move_line("down")<cr>', { desc = "Move line down" })
map("n", "<S-k>", '<cmd>lua MiniMove.move_line("up")<cr>', { desc = "Move line up" })
map("n", "<S-j>", '<cmd>lua MiniMove.move_line("down")<cr>', { desc = "Move line " })

map({ "n", "v" }, "<leader>la", "<cmd>Lspsaga code_action<CR>", { desc = "Lsp Code action" })
map({ "n", "v" }, "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", { desc = "Lsp Documentation" })
map({ "n", "v" }, "<leader>ld", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { desc = "Lsp cursor diagnostics" })
-- map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "Lsp Code action" })

map({ "n" }, "t", "<cmd>Telescope terms<CR>", { desc = "Terminal List" })

local lastTermIdUsed = 1

map({ "n" }, "<leader>t", function()
	require("nvchad.term").toggle({ pos = "float", id = lastTermIdUsed })
end, { desc = "Terminal Toggle Floating" })

for id = 1, 9 do
	map({ "n" }, id .. "<leader>t", function()
		require("nvchad.term").toggle({ pos = "float", id = id })
		lastTermIdUsed = id
	end, { desc = "Terminal Toggle to " .. id })
end

-- Harpoon
for num = 1, 9 do
	map({ "n" }, "<leader>" .. num, function()
		require("harpoon"):list():select(num)
	end, { desc = "Harppoon - Go to " .. num })
end

-- Select mode
map("v", "d", '"_d', { desc = "Delete whithout remove yank" })
map("v", "D", '"_D', { desc = "Delete whithout remove yank" })

map("v", "<S-Up>", '<cmd>lua MiniMove.move_selection("up")<cr>', { desc = "Move selection up" })
map("v", "<S-Down>", '<cmd>lua MiniMove.move_selection("down")<cr>', { desc = "Move selection down" })
map("v", "<S-k>", '<cmd>lua MiniMove.move_selection("up")<cr>', { desc = "Move selection up" })
map("v", "<S-j>", '<cmd>lua MiniMove.move_selection("down")<cr>', { desc = "Move selection down" })
