local map = vim.keymap.set

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
map("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>", { desc = "nvimtree find file" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all files" }
)
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document symbols" })
map("n", "grr", "<cmd>Telescope lsp_references<CR>", {
	desc = "LSP References",
})

-- dap
map("n", "<F5>", function()
	require("dap").continue()
end)
map("n", "<F10>", function()
	require("dap").step_over()
end)
map("n", "<F11>", function()
	require("dap").step_into()
end)
map("n", "<F12>", function()
	require("dap").step_out()
end)
map("n", "<leader>b", function()
	require("dap").toggle_breakpoint()
end)
map("n", "<leader>B", function()
	require("dap").set_breakpoint()
end)
map("n", "<leader>lp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
map("n", "<leader>dr", function()
	require("dap").repl.open()
end)
map("n", "<leader>dl", function()
	require("dap").run_last()
end)
map({ "n", "v" }, "<leader>dh", function()
	require("dap.ui.widgets").hover()
end)
map({ "n", "v" }, "<leader>dp", function()
	require("dap.ui.widgets").preview()
end)
map("n", "<leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)
map("n", "<leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)

-- persistence
-- load the session for the current directory
map("n", "<leader>qs", function()
	require("persistence").load()
end)

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- pi-nvim
map("n", "<leader>ap", ":PiSend<CR>")
map("n", "<leader>af", ":PiSendFile<CR>")
map("v", "<leader>as", ":PiSendSelection<CR>")
map("n", "<leader>ab", ":PiSendBuffer<CR>")
map("n", "<leader>ai", ":PiPing<CR>")

-- aerial
map("n", "<C-m>", "<cmd>AerialToggle left<CR>")

-- lsp
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition (LSP)" })

-- conform
vim.keymap.set("n", "<leader>q", function()
	require("conform").format()
end, { desc = "Format buffer" })
vim.keymap.set("x", "<leader>q", function()
	require("conform").format()
end, { desc = "Format selection" })
