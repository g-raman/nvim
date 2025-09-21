local servers = require("raman.config.servers")
local ensure_installed = vim.list_extend(servers, {
	"stylua",
	"prettierd",
	"prettier",
	"clang-format",
})

return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
	},
	opts = {
		ensure_installed = ensure_installed,
	},
}
