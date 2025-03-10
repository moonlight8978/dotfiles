local set = vim.keymap.set

-- Save, quit
set("n", "<leader>w", ":w<CR>")
set("n", "<leader>q", ":q<CR>")
-- q stands for quit
set("n", "<leader>qf", ":q!<CR>")
set("n", "<leader>qa", ":qa<CR>")

-- jump between buffers, b stands for buffer
set("n", "bn", ":bnext<CR>")
set("n", "bp", ":bprev<CR>")
set("n", "bd", ":bdelete<CR>")
