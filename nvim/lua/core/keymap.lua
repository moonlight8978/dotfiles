local set = vim.keymap.set

-- Source vim file
set("n", "<leader>so", ":so ~/.config/nvim/vimrc/options.vim<CR>")

-- Save, quit
set("n", "<leader>w", ":w<CR>")
set("n", "<leader>q", ":q<CR>")
set("n", "<leader>qf", ":q!<CR>")
set("n", "<leader>qa", ":qa<CR>")

-- jump between buffers
set("n", "bn", ":bnext<CR>")
set("n", "bp", ":bprev<CR>")
set("n", "bd", ":bdelete<CR>")
