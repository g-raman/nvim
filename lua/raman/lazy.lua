-- Bootstrap lazy nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local imports = {
	{ import = "raman.plugins.core" },
	{ import = "raman.plugins.lsp" },
	{ import = "raman.plugins.ui" },
	{ import = "raman.plugins.misc" },
}

local defaults = {
	intall = {
		colorscheme = { "catppuccin" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
}

require("lazy").setup(imports, defaults)
