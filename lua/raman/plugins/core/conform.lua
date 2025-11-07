local prettier_config = { "prettierd", "prettier", stop_after_first = true }

local js_config = function(bufnr)
	local biome_config_path = vim.fn.findfile("biome.json", vim.fn.expand("%:p:h") .. ";")

	if biome_config_path ~= "" and require("conform").get_formatter_info("biome", bufnr).available then
		return { "biome" }
	else
		return prettier_config
	end
end

return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },

			python = { "isort", "black" },

			javascript = js_config,
			typescript = js_config,
			javascriptreact = js_config,
			typescriptreact = js_config,

			html = js_config,
			css = js_config,
			json = js_config,

			markdown = prettier_config,

			toml = { "taplo" },
			rust = { "rustfmt" },
		},
		format_on_save = {
			lsp_fallback = false,
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
