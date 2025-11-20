local servers = require("raman.config.servers")

local lsp_highlight_group = vim.api.nvim_create_augroup("lsp-highlight", { clear = true })
local lsp_attach_group = vim.api.nvim_create_augroup("lsp-attach", { clear = true })
local lsp_detach_group = vim.api.nvim_create_augroup("lsp-detach", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
	group = lsp_attach_group,
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end
		local buf = event.buf
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		local fzf = require("fzf-lua")

		-- Navigation
		map("gd", fzf.lsp_definitions, "[G]oto [D]efinition")
		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("gi", fzf.lsp_implementations, "[G]oto [I]mplementation")
		map("gR", fzf.lsp_references, "[G]oto [R]eferences")
		map("gt", fzf.lsp_typedefs, "[G]oto [T]ype Definition")

		-- Actions
		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

		-- Info
		map("K", vim.lsp.buf.hover, "Show documentation for what is under cursor")
		map("<leader>d", vim.diagnostic.open_float, "Open [D]iagnostic")

		if client and client.server_capabilities.documentHighlightProvider then
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				group = lsp_highlight_group,
				buffer = buf,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				group = lsp_highlight_group,
				buffer = buf,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = lsp_detach_group,
				callback = function(ev)
					pcall(vim.lsp.buf.clear_references, { bufnr = ev.buf })
					vim.api.nvim_clear_autocmds({ group = lsp_highlight_group, buffer = ev.buf })
				end,
			})
		end

		if client and client.server_capabilities.inlayHintProvider then
			map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }), { bufnr = buf })
			end, "[T]oggle Inlay [H]ints")
		end
	end,
})

vim.lsp.config("tinymist", {
	settings = {
		formatterMode = "typstyle",
	},
})

vim.lsp.enable(servers)
