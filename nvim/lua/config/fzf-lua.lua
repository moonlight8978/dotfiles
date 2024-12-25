local set = vim.keymap.set

require("fzf-lua").setup({})

-- f stands for find
set("n", "<leader>ff", ":FzfLua files<CR>")
set("n", "<leader>fb", ":FzfLua buffers<CR>")
