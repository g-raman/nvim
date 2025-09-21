vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end
		local fzf = require("fzf-lua")

		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

		map("gR", fzf.lsp_references, "[G]oto [R]eferences")

		map("gi", fzf.lsp_implementations, "[G]oto [I]mplementation")

		map("gd", fzf.lsp_definitions, "[G]oto [D]efinition")

		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

		map("gt", fzf.lsp_typedefs, "[G]oto [T]ype Definition")

		map("<leader>d", vim.diagnostic.open_float, "Open [D]iagnostic")

		map("K", vim.lsp.buf.hover, "Show documentation for what is under cursor")

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})
			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end

		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "[T]oggle Inlay [H]ints")
		end
	end,
})

local servers = {
	"bashls",
	"cssls",
	"eslint",
	"html",
	"jsonls",
	"lua_ls",
	"pyright",
	"tailwindcss",
}
vim.lsp.enable(servers)
