return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		toggler = {
			line = "<leader>/",
			block = "<leader>b/",
		},
		opleader = {
			line = "<leader>/",
			block = "<leader>b/",
		},
	},
}
