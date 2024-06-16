return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local cp = require("catppuccin.palettes").get_palette()
		local catppuccin = {}
		local function get_short_cwd()
			local cwd = vim.fn.getcwd():match(".*/([^/]+)$")
			return " " .. (cwd or "")
		end

		catppuccin.normal = {
			a = { bg = cp.blue, fg = cp.mantle, gui = "bold" },
			b = { bg = cp.surface1, fg = cp.blue },
			c = { bg = cp.base, fg = cp.text },
		}

		catppuccin.insert = {
			a = { bg = cp.green, fg = cp.base, gui = "bold" },
			b = { bg = cp.surface1, fg = cp.teal },
		}

		catppuccin.command = {
			a = { bg = cp.peach, fg = cp.base, gui = "bold" },
			b = { bg = cp.surface1, fg = cp.peach },
		}

		catppuccin.visual = {
			a = { bg = cp.mauve, fg = cp.base, gui = "bold" },
			b = { bg = cp.surface1, fg = cp.mauve },
		}

		catppuccin.replace = {
			a = { bg = cp.red, fg = cp.base, gui = "bold" },
			b = { bg = cp.surface1, fg = cp.red },
		}

		catppuccin.inactive = {
			a = { bg = cp.mantle, fg = cp.blue },
			b = { bg = cp.mantle, fg = cp.surface1, gui = "bold" },
			c = { bg = cp.mantle, fg = cp.overlay0 },
		}

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				theme = catppuccin,
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "diagnostics", "branch" },
				lualine_c = {
					{
						"filename",
						filestatus = false,
						symbols = {
							modified = "",
							readonly = "",
							unnamed = "",
							newfile = "",
						},
					},
				},
				lualine_x = { { "filetype", colored = false } },
				lualine_y = {
					{
						get_short_cwd,
						color = { fg = "#cdd6f4", bg = "#45475a", gui = "italic,bold" },
					},
				},
				lualine_z = { "location" },
			},
		})
	end,
}
