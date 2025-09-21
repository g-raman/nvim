local keymap = vim.keymap

keymap.set("i", "jk", "<Esc>")
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- Fix annoying things
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "Q", "<nop>")

-- Yank to System Clipboard
keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')

-- Deletion
keymap.set("x", "<leader>p", '"_dP')
keymap.set("n", "<leader>d", '"_d')
keymap.set("v", "<leader>d", '"_d')

-- Pasting from System Clipboard
keymap.set("n", "<leader>p", '"+p')
keymap.set("v", "<leader>p", '"+p')

-- Vertical movment
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Refactor
keymap.set("n", "<leader>rf", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Window tiling
keymap.set("n", "<leader>sv", "<C-w>v") -- Split vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- Split horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- Equalize windows
keymap.set("n", "<leader>sx", ":close<CR>") -- Close window
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- Maximize/Unmaximize current window

-- Useful
keymap.set("n", "<leader>x", ":!chmod +x %<CR>")
