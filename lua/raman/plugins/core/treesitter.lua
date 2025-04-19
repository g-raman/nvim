return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",

	dependencies = {
		"windwp/nvim-ts-autotag",
	},

	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				use_languagetree = true,
			},
			indent = { enable = true },
			autotag = { enable = true },
			ensure_installed = {
				-- Web dev
				"html",
				"css",
				"javascript",
				"markdown",
				"markdown_inline",
				"json",

				-- Git
				"git_config",
				"git_rebase",
				"gitignore",

				-- Misc
				"lua",
				"python",
				"java",
				"bash",
				"vim",
			},
			auto_install = true,
		})
	end,
}
