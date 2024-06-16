local opt = vim.opt

-- Line numbers
opt.relativenumber = true
opt.number = true

-- Tabs & Spacing
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.backspace = "indent,eol,start"

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Swap files & Caching
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
opt.undofile = true

-- Highlighting
opt.hlsearch = false
opt.incsearch = true

-- UI
opt.termguicolors = true
opt.scrolloff = 10

-- Update time
opt.updatetime = 50

-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 20
vim.keymap.set("n", "<leader>le", ":Lexplore<CR>")
