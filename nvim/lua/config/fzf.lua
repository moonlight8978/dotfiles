local set = vim.keymap.set

require("fzf-lua").setup({})

-- f stands for find
set("n", "<leader>ff", ":FzfLua files<CR>")
set("n", "<leader>fb", ":FzfLua buffers<CR>")
set("n", "<leader>fg", ":FzfLua live_grep<CR>")
