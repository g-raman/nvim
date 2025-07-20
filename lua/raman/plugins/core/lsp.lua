return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		"saghen/blink.cmp",
	},
	config = function()
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
				if
					client
					and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
				then
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

		local lspconfig = require("lspconfig")
		local base_capabilities = vim.lsp.protocol.make_client_capabilities()
		local capabilities = require("blink.cmp").get_lsp_capabilities(base_capabilities)
		local servers = {
			html = {},
			cssls = {},
			jsonls = {},
			tailwindcss = {},
			eslint = {
				root_dir = lspconfig.util.root_pattern("package.json", "package-lock.json"),
			},
			denols = {
				root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
			},
			ts_ls = {
				root_markers = lspconfig.util.root_pattern("tsconfig.json", "package.json", "package-lock.json"),
				init_options = {
					preferences = {
						disableSuggestions = true,
					},
				},
			},
			bashls = {},
			pyright = {},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			},
		}

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
						disable = { "missing-fields" },
					},
				},
			},
		})

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua",
			"prettierd",
			"prettier",
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			-- Installs are populated via mason-tool-installer
			ensure_installed = {},
			automatic_installation = false,
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					lspconfig[server_name].setup(server)
				end,
			},
		})
	end,
}
