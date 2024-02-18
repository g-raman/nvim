return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			show_end_of_buffer = false,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				ufo = true,
				notify = false,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
				telescope = {
					enabled = true,
					style = "nvchad",
				},
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
