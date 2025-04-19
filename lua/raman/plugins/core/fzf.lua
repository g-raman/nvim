return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "[F]ind [F]iles",
		},
		{
			"<leader>fw",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "[F]ind [W]ords in buffer",
		},
		{
			"<leader>fc",
			function()
				require("fzf-lua").files({ cwd = "~/dotfiles/" })
			end,
			desc = "[F]ind [F]iles",
		},
	},
}
