require("nvchad.mappings")

-- add yours here
local map = vim.keymap.set

-- Insert mode
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- Normal mode
map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>f<leader>", "<cmd>Telescope resume<cr>", { desc = "Buffer close" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("n", "<leader>d/", "<cmd>noh<cr>", { desc = "Turn off highlighting until the next search" })

map("n", "<ESC>", "<cmd>q<cr>", { desc = "Close buffer" })
map("n", "<leader>q", ":bdelete<cr>", { desc = "Buffer close" })

map("n", "<c-s>", '<cmd>lua require("conform").format()<CR>:w<CR>', { desc = "File Format with conform" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })
map(
	"n",
	"<leader>E",
	"<cmd>NvimTreeToggle<cr><cmd>NvimTreeCollapse<cr>",
	{ desc = "Toggle NvimTree to the project root" }
)

map("n", "<c-->", "<c-x>", { desc = "File Format with conform" })
map("n", "<c-=>", "<c-a>", { desc = "File Format with conform" })

map("n", "d", '"_d', { desc = "Delete without remove yank" })
map("n", "D", '"_D', { desc = "Delete without remove yank" })
map("n", "c", '"_c', { desc = "Replace without remove yank" })
map("n", "x", '"_x', { desc = "Remove without remove yank" })

map("n", "<S-Up>", '<cmd>lua MiniMove.move_line("up")<cr>', { desc = "Move - line up" })
map("n", "<S-Down>", '<cmd>lua MiniMove.move_line("down")<cr>', { desc = "Move - line down" })
map("n", "<S-Left>", '<cmd>lua MiniMove.move_line("left")<cr>', { desc = "Move - line left" })
map("n", "<S-Right>", '<cmd>lua MiniMove.move_line("right")<cr>', { desc = "Move - line right" })
map("n", "<S-k>", '<cmd>lua MiniMove.move_line("up")<cr>', { desc = "Move - line up" })
map("n", "<S-j>", '<cmd>lua MiniMove.move_line("down")<cr>', { desc = "Move - line down" })
map("n", "<S-h>", '<cmd>lua MiniMove.move_line("left")<cr>', { desc = "Move - line left" })
map("n", "<S-l>", '<cmd>lua MiniMove.move_line("right")<cr>', { desc = "Move - line right" })

map("n", "C", "<cmd>%bd|e#<cr>", { desc = "Close all buffers except the current one" })
map(
	"n",
	"<leader>gg",
	'<cmd>lua require("nvchad.term").toggle { pos = "float", id = "floatTerm", cmd = "lazygit" }<CR>',
	{ desc = "LazyGit" }
)

map({ "n", "v" }, "<leader>la", "<cmd>Lspsaga code_action<CR>", { desc = "Lsp Code action" })
map({ "n", "v" }, "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", { desc = "Lsp Documentation" })
map({ "n", "v" }, "<leader>ld", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { desc = "Lsp cursor diagnostics" })

-- Simply remove if you want the default live_grep from telescope
map(
	{ "n", "v" },
	"<leader>fw",
	"<cmd>lua require('telescope.builtin').live_grep({ additional_args = { '--fixed-strings' }})<CR>",
	{ desc = "Search a string" }
)

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
	end, { desc = "Harpoon - Go to " .. num })
end

-- Visual mode
map("v", "d", '"_d', { desc = "Delete without remove yank" })
map("v", "D", '"_D', { desc = "Delete without remove yank" })
map("v", "p", '"_dP', { desc = "Paste without remove yank" })
map("v", "P", '"_dP', { desc = "Paste without remove yank" })

map("v", "<S-Up>", '<cmd>lua MiniMove.move_selection("up")<cr>', { desc = "Move - selection up" })
map("v", "<S-Down>", '<cmd>lua MiniMove.move_selection("down")<cr>', { desc = "Move - selection down" })
map("v", "<S-Left>", '<cmd>lua MiniMove.move_selection("left")<cr>', { desc = "Move - selection left" })
map("v", "<S-Right>", '<cmd>lua MiniMove.move_selection("right")<cr>', { desc = "Move - selection right" })
map("v", "<S-k>", '<cmd>lua MiniMove.move_selection("up")<cr>', { desc = "Move - selection up" })
map("v", "<S-j>", '<cmd>lua MiniMove.move_selection("down")<cr>', { desc = "Move - selection down" })
map("v", "<S-h>", '<cmd>lua MiniMove.move_selection("left")<cr>', { desc = "Move - selection left" })
map("v", "<S-l>", '<cmd>lua MiniMove.move_selection("right")<cr>', { desc = "Move - selection right" })
