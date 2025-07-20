return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },

	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "none",

			["<CR>"] = { "accept", "fallback" },

			["<Up>"] = { "select_prev", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },

			["<Down>"] = { "select_next", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },

			["<Tab>"] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.accept()
					else
						return cmp.select_and_accept()
					end
				end,
				"snippet_forward",
				"fallback",
			},
			["<S-Tab>"] = { "snippet_backward", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = {
				auto_show = true,
				window = {
					border = "rounded",
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
				},
			},
			menu = {
				border = "rounded",
				draw = {
					columns = {
						{ "kind_icon", "label", gap = 2 },
						{ "kind", "label_description", gap = 2 },
					},
					treesitter = { "lsp" },
				},
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
			},
		},
		signature = {
			enabled = true,
		},

		sources = {
			default = {
				"lsp",
				"path",
				"buffer",
				"snippets",
			},
		},
		fuzzy = { implementation = "lua", sorts = {
			"score",
			"sort_text",
			"kind",
		} },
	},
	opts_extend = { "sources.default" },
}
