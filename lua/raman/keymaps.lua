vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set("i", "jk", "<Esc>")
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- Deletion
keymap.set("n", "x", '"_x"')

-- Text movment
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Fix annoying things
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "Q", "<nop>")

-- Yanking
keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+Y')

-- Deletion
keymap.set("x", "<leader>p", '"_dP')
keymap.set("n", "<leader>d", '"_d')
keymap.set("v", "<leader>d", '"_d')

-- Pasting
keymap.set("n", "<leader>p", '"+p')
keymap.set("v", "<leader>p", '"+p')

-- Vertical movment
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Refactor
keymap.set("n", "<leader>rf", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Tmux + Nvim
keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>")
keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>")
keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>")
keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>")

-- Window tiling
keymap.set("n", "<leader>sv", "<C-w>v") -- Split vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- Split horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- Equalize windows
keymap.set("n", "<leader>sx", ":close<CR>") -- Close window
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- Maximize/Unmaximize current window

-- Useful
keymap.set("n", "<leader>x", ":!chmod +x %<CR>")
