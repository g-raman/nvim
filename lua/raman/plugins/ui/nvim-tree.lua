return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	hijack_cursor = true,
	lazy = true,
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<CR>", "Toggle Nvim Tree" },
	},
	opts = {
		sort_by = "extension",
		filters = {
			dotfiles = false,
			exclude = { vim.fn.stdpath("config") .. "/lua/custom" },
		},

		hijack_unnamed_buffer_when_opening = false,
		sync_root_with_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = false,
		},

		view = {
			adaptive_size = false,
			side = "right",
			width = 28,
			preserve_window_proportions = true,
		},

		git = {
			enable = true,
			ignore = false,
		},

		filesystem_watchers = {
			enable = true,
		},

		actions = {
			open_file = {
				resize_window = true,
			},
		},

		renderer = {
			root_folder_label = false,
			highlight_git = false,
			highlight_opened_files = "none",

			indent_markers = {
				enable = true,
			},

			icons = {
				web_devicons = {
					file = {
						enable = true,
						color = true,
					},
					folder = {
						enable = false,
						color = true,
					},
				},
				show = {
					file = true,
					folder = true,
					folder_arrow = false,
					git = true,
				},

				glyphs = {
					default = "󰈚",
					symlink = "",
					folder = {
						default = "󰉋",
						empty = "",
						empty_open = "",
						open = "",
						symlink = "",
						symlink_open = "",
						arrow_open = "",
						arrow_closed = "",
					},

					git = {
						unstaged = "✗",
						staged = "✓",
						unmerged = "",
						renamed = "➜",
						untracked = "★",
						deleted = "",
						ignored = "◌",
					},
				},
			},
		},
	},
}
