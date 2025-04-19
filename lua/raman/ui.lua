-- Diagnostics configuration
-- vim.diagnostic.config({
-- 	virtual_text = {
-- 		prefix = "",
-- 	},
-- 	severity_sort = true,
-- 	update_in_insert = false,
-- 	float = {
-- 		focusable = false,
-- 		header = "Diagnostics:",
-- 		prefix = "",
-- 	},
-- })

-- Add signs in sign column
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Override float window highlights globally
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1e1e2e", fg = "#6c7086" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e" })

-- Custom border
local border = {
	{ "╭", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╮", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "╯", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╰", "FloatBorder" },
	{ "│", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, options, ...)
	options.border = border
	return orig_util_open_floating_preview(contents, syntax, options, ...)
end
