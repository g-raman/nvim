return {
	"arborist-ts/arborist.nvim",
	lazy = false,
	dependencies = { "windwp/nvim-ts-autotag" },
	config = function()
		require("arborist").setup({
			prefer_wasm = false,
			ensure_installed = {
				"git_config",
				"git_rebase",
				"gitignore",
				"java",
				"bash",
				"vim",
			},
		})
		require("nvim-ts-autotag").setup()
	end,
}
