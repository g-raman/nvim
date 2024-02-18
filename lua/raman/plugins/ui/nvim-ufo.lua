return {
	"kevinhwang91/nvim-ufo",
	events = { "BufReadPre", "BufEnter" },
	dependencies = {
		"kevinhwang91/promise-async",
		"luukvbaal/statuscol.nvim",
	},
	config = function()
		-- Basic options
		local opt = vim.opt
		local keymap = vim.keymap

		opt.foldcolumn = "1" -- '0' is not bad
		opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		opt.foldlevelstart = 99
		opt.foldenable = true
		opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

		-- UFO
		local ufo = require("ufo")
		keymap.set("n", "zR", ufo.openAllFolds)
		keymap.set("n", "zM", ufo.closeAllFolds)

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			reculright = true,
			segments = {
				{ text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
				{ text = { "%s" }, click = "v:lua.ScSa" },
				{
					text = { builtin.lnumfunc, " " },
					condition = { true, builtin.not_empty },
					click = "v:lua.ScLa",
				},
			},
		})

		ufo.setup({
			provider_selector = function()
				return { "lsp", "indent" }
			end,

			foldcolumn = {
				nodigits = true,
			},
		})
	end,
}
