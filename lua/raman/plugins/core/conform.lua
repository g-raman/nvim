local prettier_config = { "prettierd", "prettier", stop_after_first = true }
return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },

			python = { "isort", "black" },

			javascript = prettier_config,
			typescript = prettier_config,
			javascriptreact = prettier_config,
			typescriptreact = prettier_config,

			css = prettier_config,
			html = prettier_config,
			json = prettier_config,
			markdown = prettier_config,
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		},
	},
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({
					lsp_fallback = false,
					async = false,
					timeout_ms = 1000,
				})
			end,
			mode = { "n", "v" },
			desc = "Format code",
		},
	},
}
