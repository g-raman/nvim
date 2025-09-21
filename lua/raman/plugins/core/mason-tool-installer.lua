return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		{ "j-hui/fidget.nvim", opts = {} },
	},
	opts = {
		ensure_installed = {
			-- LSP
			"bash-language-server",
			"css-lsp",
			"eslint-lsp",
			"html-lsp",
			"json-lsp",
			"lua-language-server",
			"pyright",
			"tailwindcss-language-server",

			-- Formatters
			"stylua",
			"prettierd",
			"prettier",
			"clang-format",
		},
	},
}
