require("nvchad.mappings")

-- add yours here
local map = vim.keymap.set

-- Insert mode
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map({ "n", "i", "v" }, "<C-a>", "<ESC>ggVG", { desc = "Select ALL" })

-- Normal mode
map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>f<leader>", "<cmd>Telescope resume<cr>", { desc = "Buffer close" })

map("n", "<leader>sr", "<cmd>SessionRestore<cr>", { desc = "Buffer close" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("n", "<leader>d/", "<cmd>noh<cr>", { desc = "Turn off highlighting until the next search" })

map("n", "<ESC>", "<cmd>q<cr>", { desc = "Close buffer" })
map("t", "<ESC>", "<cmd>q<cr>", { desc = "Close buffer" })
map("n", "<leader>q", ":bdelete<cr>", { desc = "Buffer close" })

-- Copilot
map(
	{ "v" },
	"<leader>cc",
	"<cmd>CopilotChatReset<cr><cmd>'<,'>CopilotChat<cr>",
	{ desc = "Copilot Chat of the Selection" }
)
map(
	{ "n" },
	"<leader>cc",
	"ggVG<cmd>CopilotChat<cr><cmd>CopilotChatToggle<cr><cmd>CopilotChat<cr>",
	{ desc = "Copilot Chat of all file" }
)
map({ "n" }, "<leader>ct", "<cmd>CopilotChatToggle<cr>", { desc = "Copilot Chat Toogle" })
map({ "n" }, "<leader>cr", "<cmd>CopilotChatReset<cr>", { desc = "Copilot Chat Reset" })

-- Split view
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "Split Horizontal" })
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Split Vertical" })
-- On Mac you need to disabled keyboard shorcuts in the settings. (I personnaly change them to works with command)
map("n", "<C-Left>", "<cmd>wincmd h<cr>", { desc = "Split View - Go to left" })
map("n", "<C-Right>", "<cmd>wincmd l<cr>", { desc = "Split View - Go to right" })
map("n", "<C-Up>", "<cmd>wincmd k<cr>", { desc = "Split View - Go to top" })
map("n", "<C-Down>", "<cmd>wincmd j<cr>", { desc = "Split View - Go to bottom" })

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

-- NPM commands
map(
	"n",
	"<leader>ns",
	require("package-info").show,
	{ silent = true, noremap = true, desc = "Npm Show dependency versions" }
)
map(
	"n",
	"<leader>nh",
	require("package-info").hide,
	{ silent = true, noremap = true, desc = "Npm Hide dependency versions" }
)
map(
	"n",
	"<leader>nu",
	require("package-info").update,
	{ silent = true, noremap = true, desc = "Npm Update dependency on the line" }
)
map(
	"n",
	"<leader>np",
	require("package-info").change_version,
	{ silent = true, noremap = true, desc = "Npm Install a different dependency version" }
)
map(
	"n",
	"<leader>nd",
	require("package-info").delete,
	{ silent = true, noremap = true, desc = "Npm Delete dependency on the line" }
)

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
	require("nvchad.term").toggle({
		pos = "float",
		id = lastTermIdUsed,
	})
end, { desc = "Terminal Toggle Floating" })

for id = 1, 9 do
	map({ "n" }, id .. "<leader>t", function()
		require("nvchad.term").toggle({
			pos = "float",
			id = id,
		})
		lastTermIdUsed = id
	end, { desc = "Terminal Toggle to " .. id })
end

-- Harpoon
for num = 1, 9 do
	map({ "n" }, "<leader>" .. num, function()
		local pipe = io.popen("git branch --show-current")
		repeat
			local c = pipe:read(4 * 1048576)
			if c then
				require("harpoon"):list(c):select(num)
			end
		until not c
		pipe:close()
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

-- Copilot
map("i", "<C-CR>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
map("i", "<C-Right>", 'copilot#AcceptWord("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true
