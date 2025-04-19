vim.diagnostic.config({
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	} or {},
	float = {
		source = true,
		border = "rounded",
		focusable = true,
	},
	virtual_text = false,
	underline = { severity = vim.diagnostic.severity.ERROR },
})

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#cdd6f4", bg = "#1e1e2e" })
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function(contents, syntax, options, ...)
	options.border = "rounded"
	return orig_util_open_floating_preview(contents, syntax, options, ...)
end
