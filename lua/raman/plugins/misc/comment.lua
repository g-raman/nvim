return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		local comment = require("Comment")
		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- enable comment
		comment.setup({
			toggler = {
				line = "<leader>/",
				block = "<leader>b/",
			},
			opleader = {
				line = "<leader>/",
				block = "<leader>b/",
			},
		})
	end,
}
