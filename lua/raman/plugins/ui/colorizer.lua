return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = {
		filetypes = { "*" },
		buftypes = {},
		user_commands = true,
		lazy_load = false,
		user_default_options = {
			names = false,
			RGB = true,
			RGBA = true,
			RRGGBB = true,
			RRGGBBAA = true,
			AARRGGBB = true,
			rgb_fn = true,
			hsl_fn = true,
			css = true,
			css_fn = true,
			-- Tailwind colors.  boolean|'normal'|'lsp'|'both'.  True sets to 'normal'
			tailwind = "both",
			tailwind_opts = {
				update_names = false,
			},
			sass = { enable = false, parsers = { "css" } },
			-- Highlighting mode.  'background'|'foreground'|'virtualtext'
			mode = "virtualtext",
			virtualtext = "",
			virtualtext_inline = "before",
			virtualtext_mode = "foreground",
			always_update = false,
			hooks = {
				disable_line_highlight = false,
			},
		},
	},
}
