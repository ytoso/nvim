return {
	"catppuccin/nvim",
	opts = {
		flavour = "mocha",
	},
	config = function()
		vim.cmd.colorscheme("catppuccin")
	end,
	name = "catppuccin",
	priority = 1000
}
