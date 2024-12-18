local set = vim.keymap.set

-- Source vim file
set("n", "<leader>r", ":so $MYVIMRC<CR>")

-- Save, quit
set("n", "<leader>w", ":w<CR>")
set("n", "<leader>q", ":q<CR>")

-- jump between buffers
set("n", "bn", ":bnext<CR>")
set("n", "bp", ":bprev<CR>")
set("n", "bd", ":bdelete<CR>")
