return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "mocha",
		show_end_of_buffer = false,
		integrations = {
			blink_cmp = true,
			fzf = true,
			gitsigns = true,
			harpoon = true,
			nvimtree = true,
			mason = true,
			treesitter = true,
			ufo = true,
			snacks = {
				enabled = false,
				indent_scope_color = "",
			},
		},
	},
}
